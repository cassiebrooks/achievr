class GoalsController < ApplicationController

  def index
    @goals = Goal.all.decorate
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
    @goal = Goal.new
    @goal.name = params[:goal][:name]
    @goal.description = params[:goal][:description]
    @goal.save
    redirect_to goal_path(@goal)
  end

end
