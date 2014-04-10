module ApplicationHelper
  def bootstrap_alert(type)
    case type
    when :alert then "alert-danger"
    when :notice then "alert-success"
    else "alert-info"
    end
  end
end
