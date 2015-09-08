class UploadsController < ApplicationController

  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
    render layout: false
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.user = current_user
    if @upload.save
      message = 'Importação realizada com sucesso.'
    else
      message = 'Não foi possível realizar a importação, verifique o formato do arquivo.'
    end
    redirect_to(uploads_path, notice: message) and return
  end

  private

  def upload_params
    params[:upload].permit(:attachment)
  end

end
