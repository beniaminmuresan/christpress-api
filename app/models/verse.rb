class Verse < ApplicationRecord
  validates_presence_of :number, :value
  belongs_to :chapter
end