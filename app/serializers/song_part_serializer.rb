# frozen_string_literal: true

class SongPartSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :song_lines
end
