# frozen_string_literal: true

class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
end
