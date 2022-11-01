class SongPart < ApplicationRecord
  validates_presence_of :name
  belongs_to :song
  has_many :song_lines
end