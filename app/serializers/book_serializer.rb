class BookSerializer < ActiveModel::Serializer
  attributes :id, :number, :name, :slug
end