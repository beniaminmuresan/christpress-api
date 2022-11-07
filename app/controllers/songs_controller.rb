class SongsController < ApplicationController
  def index
    @pagy, @records = pagy(Song.all.order(:name))
    render json: @records
  end

  def show
    song = Song.find(params[:id])
    render json: song
  end
end