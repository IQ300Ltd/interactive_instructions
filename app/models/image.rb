class Image < ActiveRecord::Base
  mount_uploader :image_source, ImageUploader

  belongs_to :step
end
