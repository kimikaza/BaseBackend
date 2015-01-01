class ApplicationController < ActionController::Base

  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_filter :authenticate!

  helper_method :warden, :signed_in?, :current_user

  def signed_in?
    !current_user.nil?
  end

  def current_user
    warden.user
  end


  def warden
    request.env['warden']
  end

  def authenticate!
    puts "AUTHENTICATING"
    unless signed_in?
      puts "NEED AUTHENTICATION"
      warden.authenticate!
    end
  end
  
end
