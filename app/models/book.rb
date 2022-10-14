class Book < ApplicationRecord
  validates_presence_of :name, :number
end