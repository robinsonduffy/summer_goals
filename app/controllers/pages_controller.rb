class PagesController < ApplicationController
  
  def home
  end
  
  def choose_kid
    @title = "Choose Kid"
    @kids = Kid.all
  end
  
  def chore_chart
    @kid = Kid.find(params[:kid_id])
    @title = "#{@kid.name}'s Chore Chart"
    @tasks = Task.all
  end

end
