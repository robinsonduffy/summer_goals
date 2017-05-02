module PagesHelper
  
  def start_of_week
    Time.current.beginning_of_week.to_date
  end
  
  def deny_access_to_rewards(kid_id)
    flash[:error] = "You have not completed all your required tasks today"
    day_id = Time.current.wday - 1
    day_id = 6 if day_id == -1
    redirect_to chore_chart_day_path(kid_id, day_id)
  end
  
end
