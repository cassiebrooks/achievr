class TasksController < ApplicationController
  def index
    goal_id = params[:goal_id]
    @tasks = current_user.goals.find(goal_id).tasks
  end
end
