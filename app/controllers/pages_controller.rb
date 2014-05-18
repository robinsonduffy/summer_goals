class PagesController < ApplicationController
  
  include PagesHelper
  
  def home
  end
  
  def choose_kid
    @title = "Choose Kid"
    @kids = Kid.all
  end
  
  def chore_chart_date_select
    kid = Kid.find(params[:kid_id])
    day_id = Time.current.wday - 1
    day_id = 6 if day_id == -1
    redirect_to chore_chart_day_url(kid, day_id)
  end
  
  def chore_chart
    @kid = Kid.find(params[:kid_id])
    @title = "#{@kid.name}'s Chore Chart"
    @tasks = @kid.tasks
    @date = start_of_week + (params[:day_id].to_i)
    @day_id = params[:day_id].to_i
  end
  
  def chore_chart_save
    kid = Kid.find(params[:kid_id])
    task = Task.find(params[:task_id])
    completed_task = CompletedTask.new(:kid_id => kid.id, :task_id => task.id, :date => start_of_week + (params[:day_id].to_i))
    completed_task.save
    kid.points = kid.points + task.points
    kid.save
    redirect_to chore_chart_day_path(kid.id, params[:day_id])
  end
  
  def chore_chart_reward_select
    @kid = Kid.find(params[:kid_id])
    @title = "#{@kid.name} - Select Reward"
    @rewards = Reward.all
  end
  
  def chore_chart_reward_purchase
    kid = Kid.find(params[:kid_id])
    reward = Reward.find(params[:reward_id])
    kid.points = kid.points - reward.points
    kid.save if kid.points >= 0
    flash[:success] = "Reward Purchased (#{reward.name})"
    redirect_to reward_select_path(kid.id)
  end
  
  def chore_chart_task_delete
    task_to_delete = CompletedTask.where(:kid_id => params[:kid_id], :task_id => params[:task_id], :date => start_of_week + (params[:day_id].to_i)).first
    if task_to_delete.nil?
      redirect_to root_path
    else
      task_to_delete.kid.points = task_to_delete.kid.points - task_to_delete.task.points
      task_to_delete.kid.points = 0 if task_to_delete.kid.points < 0
      task_to_delete.kid.save
      task_to_delete.destroy unless task_to_delete.nil?
      redirect_to chore_chart_day_path(params[:kid_id], params[:day_id])
    end
  end

end
