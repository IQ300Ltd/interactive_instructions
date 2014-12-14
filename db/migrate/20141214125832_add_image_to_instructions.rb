class AddImageToInstructions < ActiveRecord::Migration
  def change
    add_column :instructions, :image, :string
  end
end
