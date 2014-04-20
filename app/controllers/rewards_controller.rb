class RewardsController < ApplicationController
  before_filter :require_login
  before_filter :require_admin
  
  def show
    @reward = Reward.find(params[:id])
    @title = @reward.name
  end
  
  def index
    @rewards = Reward.all
    @title = "Rewards"
  end
  
  def update
    @reward = Reward.find(params[:id])
    if @reward.update_attributes(params[:reward])
      @reward.reload
      flash[:success] = "Updated #{@reward.name}"
      redirect_to rewards_path
    else
      @title = @reward.name
      render :show
    end
  end
  
  def new
    @title = "Create New Reward"
    @reward = Reward.new
  end
  
  def create
    @reward = Reward.new(params[:reward])
    if @reward.save
      flash[:success] = "Created Reward (#{@reward.name})"
      redirect_to rewards_path
    else
      @title = "Create New Reward"
      render :new
    end
  end
  
  def destroy
    reward = Reward.find(params[:id]).destroy
    flash[:success] = "Reward deleted (#{reward.name})"
    redirect_to rewards_path
  end
end
