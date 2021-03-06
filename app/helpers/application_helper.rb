module ApplicationHelper
  
  def generate_index(index,pagination_value=100)
    page = params[:page].blank?? 1 : params[:page].to_i
    (index + 1)  + (pagination_value * ( page - 1 ))
  end

  def user_types
    [["Admin","admin"],["Staff","staff"]]
  end

  def scheme_types
    [["Yeshaswini", "yeshaswini"], ["RSBY", "rsby"], ["ABY", "aby"],["RBSK","rbsk"],["VAS","vas"],["JSS","jss"],["RAB","rab"],["SER","ser"],["ARK","ark"]]
  end

  def search_scheme_types
    [["Select scheme",""],["Yeshaswini", "yeshaswini"], ["RSBY", "rsby"], ["ABY", "aby"],["RBSK","rbsk"],["VAS","vas"],["JSS","jss"],["RAB","rab"],["SER","ser"],["ARK","ark"]]
  end

  def claim_status_types
  	[["Pending", "pending"], ["Approved", "approved"], ["Paid", "paid"], ["Denied", "denied"]]
  end

  def search_status_types
    [["Select status",""],["Pending", "pending"], ["Approved", "approved"], ["Paid", "paid"], ["Denied", "denied"]]
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

  def pagination_links_method(collection = nil, options = {})
    options[:renderer] = BootstrapPagination::Rails
     will_paginate(collection, options)
  end 
      
      


end
