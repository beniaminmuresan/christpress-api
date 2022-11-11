class SongsController < ApplicationController
  has_scope :by_keyword

  def index
    songs = apply_scopes(Song).all
    songs = songs.order(:name)
    songs = paginate_items(songs)
    render json: songs
  end

  def show
    song = Song.friendly.find(params[:id])
    render json: song
  end
end