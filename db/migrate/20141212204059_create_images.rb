class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_source
      t.text :image_description
      t.integer :step_id
      t.integer :position
      t.timestamps
    end
  end
end
