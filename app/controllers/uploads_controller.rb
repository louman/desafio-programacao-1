class UploadsController < ApplicationController

  def index
    @uploads = Upload.paginate(page: params[:page])
  end

  def new
    @upload = Upload.new
    render layout: false
  end

  def create
    redirect_to(uploads_path, alert: 'Selecione um arquivo a ser importado!') and return if params[:upload].blank?
    service = FileUploaderService.new(upload_params: params[:upload], user: current_user)
    if service.upload_file
      redirect_to(upload_path(service.upload), notice: 'Importação realizada com sucesso.') and return
    else
      redirect_to(uploads_path, alert: service.errors_full) and return
    end
    
  end

  def show
    @upload = Upload.where(id: params[:id]).includes(:user, orders: :order_items).first
  end

end
