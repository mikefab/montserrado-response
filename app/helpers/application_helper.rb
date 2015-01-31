module ApplicationHelper

  def is_authorized?
    return true
    if current_user
      return current_user.is_admin
    else
      return false
    end
  end

end
