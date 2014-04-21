module PagesHelper
  
  def start_of_week
    Date.today.to_time_in_current_zone.beginning_of_week.to_date
  end
  
end
