class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  validates :name, :user_id, :presence => true
end
