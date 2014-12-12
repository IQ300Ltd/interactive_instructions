class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.timestamps
    end
  end
end
