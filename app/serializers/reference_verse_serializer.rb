class ReferenceVerseSerializer < ActiveModel::Serializer
  attributes :value, :reference_name

  def reference_name
    "#{object.chapter.book.name} #{object.chapter.number}:#{object.number}"
  end
end