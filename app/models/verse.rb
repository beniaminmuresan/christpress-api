class Verse < ApplicationRecord
  validates_presence_of :number, :value
end