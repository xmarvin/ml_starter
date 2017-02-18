class RecognizeController < ApplicationController
  def upload
    @success = false
    if params[:image].present?
      path = params[:image].tempfile.path
      res = RecognitionServiceWrapper.recognize(path)
      @success = res['success']
      @predictions = res['prediction']
    end
  end

  def new
  end
end
