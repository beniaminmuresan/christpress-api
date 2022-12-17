# frozen_string_literal: true

class Verse < ApplicationRecord
  default_scope { order(:number) }

  validates_presence_of :number, :value
  belongs_to :chapter
  has_many :verse_reference_verses
  has_many :reference_verses, through: :verse_reference_verses, class_name: :Verse
end
