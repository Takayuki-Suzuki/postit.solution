module ApplicationHelper
  def fix_url(str)
    str.start_with?("http://") ? str : "http://#{str}"
  end

  def display_datetime(dt)
    time = Time.at(dt)
    if logged_in? && !current_user.time_zone.blank?
      time = time.in_time_zone(current_user.time_zone)
    end
    time.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
