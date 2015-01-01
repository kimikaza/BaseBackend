class TokenStrategy < ::Warden::Strategies::Base
  def valid?
    if !params || !params['user'] then return false end
    !params['user']['email'] && !params['user']['password'] && params['user']['auth_token']
  end
  
  def authenticate!
    user = User.find_by_auth_token(params["user"].fetch("auth_token"))
    if user.nil? || user.auth_token != params["user"].fetch("auth_token")
      fail! :message => "strategies.password.failed"
    else
      success! user
    end
  end
end

Warden::Strategies.add(:token, TokenStrategy)