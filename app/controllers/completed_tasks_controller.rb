class CompletedTasksController < ApplicationController
  before_filter :require_login
  before_filter :require_admin
  
  def destroy
    completed_task = CompletedTask.find(params[:id])
    completed_task.destroy
    flash[:success] = "Completed Task Deleted"
    redirect_to kid_completed_tasks_path(completed_task.kid.id)
  end
  
end