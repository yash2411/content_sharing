class AudiosController < ApplicationController
  def index
  end

  def new
    @audio = Audio.new
  end

  def create
    @audio = current_user.audios.build(audio_params)
    if @audio.save
      flash[:success] = 'Audio published successfully'
      redirect_to root_path
    else
      flash.now[:danger] = 'Something went wrong, please try again'
    end
  end

  private

  def audio_params
    params.require(:audio).permit(:title, :description, audios: [])
  end
end
