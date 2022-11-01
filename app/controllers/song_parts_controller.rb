class SongPartsController < ApplicationController
  def index
    song = Song.find(params[:song_id])
    render json: song.song_parts
  end
end