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
    @task.status = false
    respond_to do |format|
      if @task.save
        format.html { redirect_to [@goal, @task], notice: "Task was successfully created."}
      else
        render :new
      end
    end
  end

  def show
    @task = @goal.tasks.find(params[:id])
  end

  def edit
    @task = @goal.tasks.find(params[:id])
  end

  def update
    @task = @goal.tasks.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to [@goal, @task]
    else
      render :edit
    end
  end

  private

  def load_goal
    @goal = Goal.find(params[:goal_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status)
  end
end
