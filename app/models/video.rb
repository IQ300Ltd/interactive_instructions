class Video < ActiveRecord::Base

  belongs_to :step

  validates :video_source, presence: true

  after_save :normalize_link

  def normalize_link
    normalized_link = "//www.youtube.com/embed/#{video_source.partition('=').last}"
    self.update_column(:video_source, "//www.youtube.com/embed/#{video_source.partition('=').last}")
  end
end
