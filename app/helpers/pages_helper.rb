module PagesHelper
  
  def start_of_week
    Time.current.beginning_of_week.to_date
  end
  
end
