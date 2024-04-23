class VideosController < ApplicationController
  def index
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      flash[:success] = 'Video published successfully'
      redirect_to root_path
    else
      flash.now[:danger] = 'Something went wrong, please try again'
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, videos: [])
  end
end
