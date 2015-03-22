class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def can_view?
      puts current_user.inspect
      puts "!!!!"

    if current_user
      !['admin', 'editor', 'viewer'].select{|e| e == current_user.role}.empty?
    else
      return false
    end
  end

  def is_authorized?
    Track.create(ip: request.remote_ip, params: params)
     authenticate_user!
    if current_user
      redirect_to '/' unless current_user.role == 'admin'
    else
      redirect_to '/'
    end
  end
end
