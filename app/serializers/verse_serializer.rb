# frozen_string_literal: true

class VerseSerializer < ActiveModel::Serializer
  attributes :id, :number, :value
  has_many :reference_verses, serializer: ReferenceVerseSerializer
end
