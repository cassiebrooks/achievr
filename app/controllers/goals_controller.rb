class GoalsController < ApplicationController
  def index
    @goals = GoalDecorator.all(:order => "created_at DESC")
    respond_to do |format|
      format.html
    end
  end

  def create
    @goal = GoalDecorator.create(:name => params[:name], :description => params[:description])
    respond_to do |format|
      if @goal.save
        format.html { redirect_to goals_path }
      else
        flash[:notice] = "Goal failed to save."
        format.html { redirect_to goals_path }
      end
    end
  end
end
