class Step < ActiveRecord::Base

  TYPE_MAPPER = { Video: :video, Image: :image, Text: :text}

  belongs_to :instruction

  has_many :videos
  has_many :images
  has_many :texts

  accepts_nested_attributes_for :videos, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :texts, :reject_if => :all_blank, :allow_destroy => true

  def sorted_attachments
    attachments = videos.to_a | images.to_a | texts.to_a
    attachments = attachments.sort_by { |obj| obj.position }
    result = []
    attachments.each do |a|
      result << { type: TYPE_MAPPER[a.class.name.to_sym], data: a.to_json }
    end
    result
  end

end
