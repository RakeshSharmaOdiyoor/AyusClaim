module ApplicationHelper
  def scheme_types
    [["Yeshaswini", "yeshaswini"], ["RSBY", "rsby"], ["ABY", "aby"]]
  end

  def claim_status_types
  	[["Pending", "pending"], ["Approved", "approved"], ["Paid", "paid"], ["Denied", "denied"]]
  end

  def search_status_types
    [["Status",""],["Pending", "pending"], ["Approved", "approved"], ["Paid", "paid"], ["Denied", "denied"]]
  end

  def gender_types
    [["Male", "male"], ["Female", "female"],["Others","others"]]
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

  def check_scheme(value)
    if value == "RSBY"
      return rsby
    elsif value == "Yeshaswini"
      return yeshaswini
    elsif value == "ABY"
      return aby
    else
      return false
    end
  end

  def check_status(value)
    if value == "Paid"
      return 'paid'
    elsif value == "Approved"
      return 'approved'
    elsif value == "Denial"
      return 'denied'
    elsif value == "Pending"
      return 'pending'
    else
      return false
    end
  end
      
      


end
