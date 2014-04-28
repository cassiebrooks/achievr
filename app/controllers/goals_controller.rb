class GoalsController < ApplicationController


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
    redirect_to goal_path(@goal)
  end

  def edit
    @goal = Goal.find(params[:id])
  end


  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to @goal
    else
      render :edit
    end
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
    params.require(:goal).permit(:name, :description, tasks_attributes: [:id, :description, :_destroy])
  end

end
