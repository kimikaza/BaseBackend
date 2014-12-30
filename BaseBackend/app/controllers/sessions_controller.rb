class SessionsController < ApplicationController
  skip_before_filter :authenticate!

  def new
    @user = User.new
  end

  def create
    authenticate!
    redirect_to user_path(current_user)
  end

  def destroy
    warden.logout
    redirect_to sessions_path
  end
end
