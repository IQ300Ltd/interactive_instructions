class AddUnderstandCounColumnToStepStatistics < ActiveRecord::Migration
  def change
    add_column :step_statistics, :understand_count, :integer, default: 0
  end
end
