class CreateBibleReadingPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :bible_reading_plans do |t|
      t.integer :no_of_items
      t.string :read_unit
      t.string :time_unit
      t.integer :notification_hour
      t.integer :notification_minute
      t.date :start_date
      t.string :notifications, array: true, default: []
      t.timestamps
    end
  end
end
