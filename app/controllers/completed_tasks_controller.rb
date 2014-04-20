class CompletedTasksController < ApplicationController
  before_filter :require_login
  before_filter :require_admin
  
  def destroy
    completed_task = CompletedTask.find(params[:id])
    completed_task.kid.points = completed_task.kid.points - completed_task.task.points
    completed_task.kid.points = 0 if completed_task.kid.points < 0
    completed_task.kid.save
    completed_task.destroy
    flash[:success] = "Completed Task Deleted"
    redirect_to kid_completed_tasks_path(completed_task.kid.id)
  end
  
end