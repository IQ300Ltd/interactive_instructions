class Step < ActiveRecord::Base

  TYPE_MAPPER = { Video: :video, Image: :image, Text: :text}

  belongs_to :instruction

  has_many :videos
  has_many :images
  has_many :texts

  has_one :step_statistic

  validates :position, presence: true

  accepts_nested_attributes_for :videos, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :texts, :reject_if => :all_blank, :allow_destroy => true

  after_create :create_step_statistic

  def sorted_attachments
    attachments = videos.to_a | images.to_a | texts.to_a
    attachments = attachments.sort_by { |obj| obj.position }
    result = []
    attachments.each do |a|
      result << { type: TYPE_MAPPER[a.class.name.to_sym], data: a.to_json }
    end
    result
  end

  def create_step_statistic
    self.step_statistic = StepStatistic.create!(step: self)
  end

end
