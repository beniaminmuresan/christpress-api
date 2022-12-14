# frozen_string_literal: true

class Chapter < ApplicationRecord
  default_scope { order(:number) }

  validates_presence_of :number
  belongs_to :book
  has_many :verses
end
