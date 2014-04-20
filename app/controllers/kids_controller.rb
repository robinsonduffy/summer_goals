class KidsController < ApplicationController
  before_filter :require_login
  before_filter :require_admin
  
  def show
    @kid = Kid.find(params[:id])
    @title = @kid.name
    @tasks = Task.all
  end
  
  def index
    @kids = Kid.all
    @title = "Kids"
  end
  
  def update
    params[:kid][:task_ids] ||= []
    @kid = Kid.find(params[:id])
    if @kid.update_attributes(params[:kid])
      @kid.reload
      flash[:success] = "Updated #{@kid.name}"
      redirect_to kids_path
    else
      @title = @kid.name
      render :show
    end
  end
  
  def completed_tasks
    @kid = Kid.find(params[:kid_id])
    @completed_tasks = @kid.completed_tasks.order('date desc')
    @title = "#{@kid.name} - Completed Tasks"
  end
end
