class SongsController < ApplicationController
  def index
    render json: Song.all.order(:name)
  end

  def show
    song = Song.find(params[:id])
    render json: song
  end
end