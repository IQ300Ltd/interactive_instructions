class Video < ActiveRecord::Base

  belongs_to :step

  validates :video_source, presence: true
end
