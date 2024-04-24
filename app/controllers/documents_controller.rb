class DocumentsController < ApplicationController
  def index
  end

  def new
    @document = Document.new
  end

  def create
    byebug

    @document = current_user.documents.build(document_params)
    if @document.save
      flash[:success] = 'Document published successfully'
      redirect_to root_path
    else
      flash.now[:danger] = 'Something went wrong, please try again'
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :description, files: [])
  end

end
