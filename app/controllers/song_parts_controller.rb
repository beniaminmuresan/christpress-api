# frozen_string_literal: true

class SongPartsController < ApplicationController
  def index
    song = Song.friendly.find(params[:song_id])
    render json: song.song_parts
  end
end
