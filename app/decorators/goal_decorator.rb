class GoalDecorator < Draper::Decorator
  decorates :goal
  delegate_all

  def decname
    object.name
  end

  def percentage
    return '0%' if object.tasks.count == 0

    completed_tasks = object.tasks.reduce(0) do |sum, task|
      sum += 1 if task.status
      sum
    end

    "#{(completed_tasks.to_f / object.tasks.count)*100}%"
  end
end
