class Song < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name
  has_many :song_parts, dependent: :destroy

  scope :by_keyword, lambda { |keyword|
    where('songs.name ILIKE ?', "%#{keyword}%") 
  }
end