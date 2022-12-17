# frozen_string_literal: true

class SongLine < ApplicationRecord
  validates_presence_of :value
  belongs_to :song_part
end
