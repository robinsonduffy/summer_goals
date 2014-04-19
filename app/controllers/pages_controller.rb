class PagesController < ApplicationController
  
  def home
  end
  
  def choose_kid
    @title = "Choose Kid"
    @kids = Kid.all
  end
  
  def chore_chart
    
  end

end
