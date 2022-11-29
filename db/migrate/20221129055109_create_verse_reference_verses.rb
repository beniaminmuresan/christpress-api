class CreateVerseReferenceVerses < ActiveRecord::Migration[7.0]
  def change
    create_table :verse_reference_verses do |t|
      t.references :verse, index: true
      t.references :reference_verse, references: :verse, index: true
    end
  end
end
