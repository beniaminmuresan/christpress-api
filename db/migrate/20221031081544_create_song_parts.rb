class CreateSongParts < ActiveRecord::Migration[7.0]
  def change
    create_table :song_parts do |t|
      t.string :name
      t.references :song
      t.timestamps
    end
  end
end
