class OmniauthController < ApplicationController

  skip_before_filter :authenticate!

  def create
    #raise env['omniauth.auth'].to_yaml

    puts "email=#{env['omniauth.auth'][:info][:email]}"
    @user = User.from_omniauth(env['omniauth.auth'])
    session[:id] = @user.id
    warden.set_user @user
    puts "currentuser= #{current_user}"
    redirect_to user_path(current_user), notice: "Signed in."

  end


  #made only for json loging, AFTER the permission has been given to the app
  def fb_login

    token = params[:token]

    user_fb = FbGraph2::User.me(token)
    user_fb = user_fb.fetch

    if(user_fb) then
      #picurl = "https://graph.facebook.com/#{user_fb.id}/picture?type=square&width=640&height=640"
      #fb_id = user_fb.id
    end

    @our_user = User.from_email(user_fb.email)

  end

end
