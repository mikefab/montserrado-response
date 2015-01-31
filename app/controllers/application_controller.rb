class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_authorized?
    Track.create(ip: request.remote_ip, params: params)
    return true
    authenticate_user!
    if current_user
      redirect_to '/' unless current_user.is_admin
    else
      redirect_to '/'
    end
  end
end
