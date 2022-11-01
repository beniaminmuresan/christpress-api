class CreateSongLines < ActiveRecord::Migration[7.0]
  def change
    create_table :song_lines do |t|
      t.string :value
      t.references :song_part
      t.timestamps
    end
  end
end
