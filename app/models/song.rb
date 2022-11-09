class Song < ApplicationRecord
  validates_presence_of :name
  has_many :song_parts, dependent: :destroy
end