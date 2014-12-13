class Image < ActiveRecord::Base
  mount_uploader :image_source, ImageUploader

  belongs_to :step
  validates :image_source, presence: true
  validates :position, presence: true
end
