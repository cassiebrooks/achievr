class Task < ActiveRecord::Base
  belongs_to :goal
  validates :name, :goal_id, :presence => true

end
