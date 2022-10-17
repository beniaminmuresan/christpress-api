class Chapter < ApplicationRecord
  validates_presence_of :number
  belongs_to :book
  has_many :verses
end