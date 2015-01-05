class TokenStrategy < ::Warden::Strategies::Base
  def valid?

    auth_token = token

    if !auth_token then 
      return false 
    else
      return true
    end
    
  end
  
  def authenticate!
    user = User.find_by_auth_token(token)
  
    if user.nil? || user.auth_token != token
      fail! :message => "strategies.password.failed"
    else
      success! user
    end
  end

  private

  def token

    mytoken = token_from_http

    if mytoken==nil
      return token_from_params
    else
      return mytoken
    end

  end

  def token_from_http

    auth_header = request.env.select {|k,v| k.start_with? 'HTTP_AUTHORIZATION'}
    auth_field = auth_header['HTTP_AUTHORIZATION']
    if auth_field!=nil && auth_field.start_with?('Token ')
      auth_data = auth_field.sub('Token ', '')
      user_array = auth_data.split('=')
      return user_array[1]
    else
      return nil
    end

  end

  def token_from_params
    if params!=nil && params['user']!=nil
      return params['user']['auth_token']
    else
      return nil
    end
  end

end

Warden::Strategies.add(:token, TokenStrategy)