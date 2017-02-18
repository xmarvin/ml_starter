class RecognitionServiceWrapper
  PORT = 5005
  HOST = '127.0.0.1'
  def self.recognize(path)
    socket = TCPSocket.new(HOST, PORT)
    socket.send(path, 0)
    json_response = socket.read
    JSON.parse(json_response)
  rescue => ex
    Rails.logger.error("[RecognitionServiceWrapper] Error: #{ex.message}")
    nil
  ensure
    puts "*1000000"
    socket.close if socket
  end
end
