class Verse < ApplicationRecord
  default_scope { order(:number) }

  validates_presence_of :number, :value
  belongs_to :chapter
end