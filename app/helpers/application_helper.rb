module ApplicationHelper
  def scheme_types
    [["Yeshaswini", "yeshaswini"], ["RSBY", "rsby"], ["ABY", "aby"]]
  end

  def claim_status_types
  	[["Pending", "pending"], ["Approved", "approved"], ["Paid", "paid"], ["Denied", "denied"]]
  end

  def divider
    "<span class='divider'> <i class='icon-hand-right'></i> </span>".html_safe
  end

  def link_text(label, icon)
    "<i class='#{icon}'></i>  #{label}".html_safe  
  end

  def date_format(date)
    return "" if date.blank?
    date.strftime("%d-%m-%Y")
  end

  def bool_to_glyph(value)
    value ? "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>".html_safe : "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>".html_safe
  end

end
