class AddDescriptionAndImageToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :image, :string
    add_column :steps, :description, :text
  end
end
