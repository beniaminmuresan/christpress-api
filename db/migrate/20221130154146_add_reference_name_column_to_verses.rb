class AddReferenceNameColumnToVerses < ActiveRecord::Migration[7.0]
  def change
    add_column :verses, :reference_name, :string
  end
end
