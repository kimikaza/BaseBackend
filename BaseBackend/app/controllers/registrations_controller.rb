class RegistrationsController < ApplicationController
  skip_before_filter :authenticate!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = t("registrations.user.success")
      redirect_to :root
    end
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :username)
    end
end