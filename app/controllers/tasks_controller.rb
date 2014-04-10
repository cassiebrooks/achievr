class TasksController < ApplicationController
  before_filter :load_goal

  def index
    @tasks = @goal.tasks.all
  end

  def new
    @task = @goal.tasks.new
  end

  def create
    @task = @goal.tasks.new(task_params)
    respond_to do |format|
    p @task
    puts "LALALALALALALALALALALALALALALALALALALALALALALALALALALALALALLALALA"
      if @task.save
        format.html { redirect_to [@goal, @task], notice: "Task was successfully created."}
      end
    end
  end

  def show
    @task = @goal.tasks.find(params[:id])
  end

  private

  def load_goal
    @goal = Goal.find(params[:goal_id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
