class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_authorized?
    if current_user
      redirect_to '/' unless current_user.is_admin
    else
      redirect_to '/'
    end
  end
end
