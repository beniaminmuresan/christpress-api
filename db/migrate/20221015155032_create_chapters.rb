class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.integer :number
      t.references :book
      t.timestamps
    end
  end
end
