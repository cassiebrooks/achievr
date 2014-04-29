class GoalDecorator < Draper::Decorator
  decorates :goal
  delegate_all

  def tasks_for_index
    tasks = object.tasks.limit(3)
    tasks.each do |t|
      "%p#{t.name}"
    end
  end

  def decname
    object.name
  end

  def percentage
    return '0%' if object.tasks.count == 0

    # if object.tasks.count == 0
      # zero_tasks

    completed_tasks = object.tasks.reduce(0) do |sum, task|
      sum += 1 if task.status
      sum
    end

    "#{(completed_tasks.to_f / object.tasks.count)*100}".split(".")[0] + "%"
  end

  private

  def zero_tasks
    # display checkbox: goal achieved?
  end

end
