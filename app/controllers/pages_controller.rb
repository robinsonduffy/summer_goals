class PagesController < ApplicationController
  
  include PagesHelper
  
  def home
  end
  
  def choose_kid
    @title = "Choose Kid"
    @kids = Kid.all
  end
  
  def chore_chart
    @kid = Kid.find(params[:kid_id])
    @title = "#{@kid.name}'s Goal Chart"
    @tasks = @kid.tasks
  end
  
  def chore_chart_save
    kid = Kid.find(params[:kid_id])
    task = Task.find(params[:task_id])
    completed_task = CompletedTask.new(:kid_id => kid.id, :task_id => task.id, :date => start_of_week + (params[:day_id].to_i))
    completed_task.save
    redirect_to chore_chart_day_path(kid.id, params[:day_id])
  end
  
  def chore_chart_task_delete
    task_to_delete = CompletedTask.where(:kid_id => params[:kid_id], :task_id => params[:task_id], :date => start_of_week + (params[:day_id].to_i)).first
    if task_to_delete.nil?
      redirect_to root_path
    else
      task_to_delete.destroy unless task_to_delete.nil?
      redirect_to chore_chart_day_path(params[:kid_id], params[:day_id])
    end
  end

end
