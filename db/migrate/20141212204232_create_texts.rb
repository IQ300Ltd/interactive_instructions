class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.text :text_description
      t.integer :step_id
      t.integer :position
      t.timestamps
    end
  end
end
