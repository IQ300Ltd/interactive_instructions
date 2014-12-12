class Instruction < ActiveRecord::Base

  has_many :steps

  belongs_to :user

end
