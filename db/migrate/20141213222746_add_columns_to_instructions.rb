class AddColumnsToInstructions < ActiveRecord::Migration
  def change
    add_column :instructions, :token, :string
  end
end
