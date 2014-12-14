class Instruction < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :steps

  belongs_to :user
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :steps, :reject_if => :all_blank, :allow_destroy => true

  validates :title, presence: true
  validates :description, presence: true

  def should_generate_new_friendly_id?
    title_changed?
  end

end
