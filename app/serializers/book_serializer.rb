# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :number, :name, :slug
end
