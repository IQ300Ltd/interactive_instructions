class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_source
      t.integer :step_id
      t.integer :position
      t.timestamps
    end
  end
end
