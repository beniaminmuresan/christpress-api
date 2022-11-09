class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
end