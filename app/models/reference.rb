# frozen_string_literal: true

class VerseReferenceVerse < ApplicationRecord
  belongs_to :verse
  belongs_to :reference_verse, class_name: :Verse
end
