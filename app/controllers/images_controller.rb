class ImagesController < ApplicationController
  def index
  end

  def new
    @image = Image.new
  end

  def turbo_frame_form
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      flash[:success] = 'Image published successfully'
      redirect_to root_path
    else
      flash.now[:danger] = "Can't publish the image"
    end
  end

  private

  def image_params
    params.require(:image).permit(:caption, images: [])
  end

end
