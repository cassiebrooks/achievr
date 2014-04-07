class GoalDecorator < Draper::Decorator
  decorates :goal
  delegate_all

  def decname
    object.name
  end

end
