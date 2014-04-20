class PagesController < ApplicationController
  
  def home
  end
  
  def choose_kid
    @title = "Choose Kid"
    @kids = Kid.all
  end
  
  def chore_chart_date_select
    @kid = Kid.find(params[:kid_id])
    @title = "#{@kid.name}'s Chore Chart"
    @day_id = 999
  end
  
  def chore_chart
    @kid = Kid.find(params[:kid_id])
    @title = "#{@kid.name}'s Chore Chart"
    @tasks = @kid.tasks
    @date = Date.today.beginning_of_week + (params[:day_id].to_i - 1)
    @day_id = params[:day_id].to_i
  end
  
  def chore_chart_save
    kid = Kid.find(params[:kid_id])
    task = Task.find(params[:task_id])
    completed_task = CompletedTask.new(:kid_id => kid.id, :task_id => task.id, :date => Date.today.beginning_of_week + (params[:day_id].to_i - 1))
    completed_task.save
    kid.points = kid.points + task.points
    kid.save
    redirect_to chore_chart_day_path(kid.id, params[:day_id])
  end

end
