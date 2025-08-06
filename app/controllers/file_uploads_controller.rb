class FileUploadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_file_upload, only: [:show, :edit, :update, :destroy]
  
  def index
    @files = current_user.file_uploads
  end
  
  def new
    @file_upload = current_user.file_uploads.new
  end
  
  def create
    @file_upload = current_user.file_uploads.new(file_upload_params)
    if @file_upload.save
      redirect_to file_uploads_path, notice: "File uploaded successfully."
    else
      render :new
    end
  end
  
  def edit
    @file_upload = current_user.file_uploads.find(params[:id])
  end
  
  def update
    @file_upload = current_user.file_uploads.find(params[:id])
    if @file_upload.update(file_upload_params)
      redirect_to file_uploads_path, notice: "File updated successfully."
    else
      render :edit
    end
  end
  
  def destroy
    if @file_upload
      @file_upload.destroy
      redirect_to file_uploads_path, notice: "File deleted."
    else
      redirect_to file_uploads_path, alert: "File not found or not authorized."
    end
  end
  
  def show
    @file_upload = current_user.file_uploads.find(params[:id])
    # This will render the show view for the file upload
  rescue ActiveRecord::RecordNotFound
    redirect_to file_uploads_path, alert: "File not found."
  end
  
  def public_show
    @file_upload = FileUpload.find_by!(slug: params[:slug])
  end
  
  private
  
  def set_file_upload
    @file_upload = current_user.file_uploads.find_by(id: params[:id])
  end
  
  def file_upload_params
    params.require(:file_upload).permit(:title, :description, :file, :public)
  end
end
