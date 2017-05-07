class TasksController < ApplicationController
  before_filter :require_login
  before_filter :require_admin
  
  def index
    @tasks = Task.order(:name).all
    @title = "Tasks"
  end
  
  def show
    @task = Task.find(params[:id])
    @title = @task.name
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      @task.reload
      flash[:success] = "Updated Task (#{@task.name})"
      redirect_to tasks_path
    else
      @title = @task.name
      render :show
    end
  end
  
  def new
    @title = "Create New Task"
    @task = Task.new
  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:success] = "Created Task (#{@task.name})"
      redirect_to tasks_path
    else
      @title = "Create New Task"
      render :new
    end
  end
end
