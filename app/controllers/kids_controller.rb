class KidsController < ApplicationController
  before_filter :require_login
  before_filter :require_admin
  
  def edit
    @kid = Kid.find(params[:id])
    @title = @kid.name
  end
  
  def index
    @kids = Kid.all
    @title = "Kids"
  end
  
  def update
    @kid = Kid.find(params[:id])
    if @kid.update_attributes(params[:kid])
      @kid.reload
      flash[:success] = "Updated #{@kid.name}"
      redirect_to kids_path
    else
      @title = @kid.name
      render :edit
    end
  end
  
  def completed_tasks
    @kid = Kid.find(params[:kid_id])
    @completed_tasks = @kid.completed_tasks.order('date desc')
    @title = "#{@kid.name} - Completed Tasks"
  end
end
