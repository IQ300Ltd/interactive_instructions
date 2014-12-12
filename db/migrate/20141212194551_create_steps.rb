class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title
      t.integer :position
      t.integer :instruction_id
      t.timestamps
    end
  end
end
