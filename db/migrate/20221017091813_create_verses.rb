class CreateVerses < ActiveRecord::Migration[7.0]
  def change
    create_table :verses do |t|
      t.references :chapter
      t.integer :number
      t.string :value
      
      t.timestamps
    end
  end
end
