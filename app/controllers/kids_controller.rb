class KidsController < ApplicationController
  before_filter :require_login
  before_filter :require_admin
  
  def show
    @kid = Kid.find(params[:id])
    @title = @kid.name
    @tasks = Task.order(:name).all
  end
  
  def index
    @kids = Kid.order(:name).all
    @title = "Kids"
  end
  
  def update
    @kid = Kid.find(params[:id])
    params[:task_ids] ||= []
    params[:goals] ||= {}
    @kid.assigned_tasks.each do |assigned_task|
      assigned_task.destroy unless params[:task_ids].include?assigned_task.task_id
    end
    params[:task_ids].each do |task_id|
      assigned_task = AssignedTask.where(:kid_id => @kid.id, :task_id => task_id).first() || AssignedTask.new(:kid_id => @kid.id, :task_id => task_id)
      assigned_task.goal = params[:goals][task_id] || 0
      assigned_task.save
    end
    if @kid.update_attributes(params[:kid])
      @kid.reload
      flash[:success] = "Updated #{@kid.name}"
      redirect_to kid_path(@kid)
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
