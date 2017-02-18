#!/usr/bin/env python

import socket
import json
import xception

TCP_IP = '127.0.0.1'
TCP_PORT = 5005
BUFFER_SIZE = 1024

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((TCP_IP, TCP_PORT))
s.listen(1)

while 1:
  conn, addr = s.accept()
  print 'Connection address:', addr
  path = conn.recv(BUFFER_SIZE)
  print "received data:", path

  result = xception.recognize(path)
  response = {'success': False }
  if result is not None:
    response = {'success': True, 'prediction': result}

  json_response = json.dumps(response)
  conn.send(json_response)
  conn.close()
