class AddSlugColumnToIntructions < ActiveRecord::Migration
  def change
    add_column :instructions, :slug, :string
    add_index :instructions, :slug, unique: true
  end
end
