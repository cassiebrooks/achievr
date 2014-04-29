class TasksController < ApplicationController
  before_filter :load_goal
  respond_to :html, :json

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
        format.html { redirect_to @goal, notice: "Task was successfully created."}
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
    @task.update_attributes(task_params)
    respond_with [@goal, @task]
  end

  def destroy
    @task = @goal.tasks.find(params[:id])
    @task.destroy
    redirect_to goal_tasks_path
   end

  private

  def load_goal
    @goal = Goal.find(params[:goal_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status)
  end
end
