class Instruction < ActiveRecord::Base

  has_many :steps

  belongs_to :user

  accepts_nested_attributes_for :steps, :reject_if => :all_blank, :allow_destroy => true

  validates :title, presence: true
  validates :description, presence: true
end
