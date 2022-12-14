class Song < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name
  has_many :song_parts, dependent: :destroy
  has_many :song_lines, through: :song_parts

  scope :by_keyword, lambda { |keyword|
    joins(:song_lines)
      .where('songs.name ILIKE ?', "%#{keyword}%")
      .or(where('song_lines.value ILIKE ?', "%#{keyword}%"))
      .distinct
  }
end