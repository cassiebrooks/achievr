class GoalsController < ApplicationController
  respond_to :html, :json

  def index
    @goals = current_user.goals.decorate
    respond_to do |format|
      format.html
    end
  end

  def completed
    @goals = current_user.goals.decorate
    respond_to do |format|
      format.html
    end
  end

  def show
    @goal = Goal.find(params[:id]).decorate
  end

  def new
    @goal = Goal.new.decorate
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    @goal.status = false
    @goal.save
    respond_with @goal
  end

  def edit
    @goal = Goal.find(params[:id])
  end


  def update
    @goal = Goal.find(params[:id])
    @goal.update_attributes(goal_params)
    respond_with @goal
  end

  def destroy
    Goal.find(params[:id]).destroy
    redirect_to goals_path
   end

  private

  def user_is_current_user
    unless current_user.id == params[:user_id]
      redirect_to root_path
    end
  end

  def goal_params
    params.require(:goal).permit(:name, :description, tasks_attributes: [:id, :name, :description, :_destroy])
  end

end
