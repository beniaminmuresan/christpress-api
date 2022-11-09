class SongsController < ApplicationController
  def index
    songs = Song.all.order(:name)
    songs = paginate_items(songs)
    render json: songs
  end

  def show
    song = Song.find(params[:id])
    render json: song
  end
end