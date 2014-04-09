class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  validates :name, :user_id, :presence => true
  accepts_nested_attributes_for :tasks
end
