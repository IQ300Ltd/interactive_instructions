class CreateStepStatistics < ActiveRecord::Migration
  def change
    create_table :step_statistics do |t|
      t.integer :step_id
      t.integer :viewed_count, default: 0
      t.timestamps
    end
  end
end
