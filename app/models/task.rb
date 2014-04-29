class Task < ActiveRecord::Base
  belongs_to :goal
  validates :name, :presence => true

end
