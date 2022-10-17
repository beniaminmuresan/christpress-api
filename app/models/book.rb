class Book < ApplicationRecord
  validates_presence_of :name, :number
  has_many :chapters
end