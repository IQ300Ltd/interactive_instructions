class Text < ActiveRecord::Base

  belongs_to :step

  validates :text_description, presence: true
  validates :position, presence: true
end
