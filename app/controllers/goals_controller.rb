class GoalsController < ApplicationController
  def index
    @goals = Goal.all(:order => "created_at DESC")
    respond_to do |format|
      format.html
    end
  end

  def create
    @goal = Goal.create(:name => params[:name], :description => params[:description])
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
