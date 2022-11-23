class Book < ApplicationRecord
  default_scope { order(:number) }

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :number
  has_many :chapters
end