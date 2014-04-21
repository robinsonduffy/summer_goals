class PagesController < ApplicationController
  
  include PagesHelper
  
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

end
