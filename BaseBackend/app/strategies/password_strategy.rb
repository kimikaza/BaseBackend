class PasswordStrategy < ::Warden::Strategies::Base

  def valid?
    username_password_hash = username_password
    puts "USERNAMEPASSWORD=#{username_password_hash}"
    if username_password_hash != nil
      username = username_password_hash['username']
      password = username_password_hash['password']
    end

    if !username_password_hash || !username || !password then return false end

    return username && password

  end

  # def authenticate!
  #   user = User.find_by_email(params["user"].fetch("email"))
  #   if user.nil? || user.confirmed_at.nil? || user.password != params["user"].fetch("password")
  #     fail! :message => "strategies.password.failed"
  #   else
  #     success! user
  #   end
  # end

  def authenticate!
    username_password_hash = username_password
    
    username = username_password_hash['username']
    password = username_password_hash['password']

    user = User.find_by_email(username)
    if user.nil? || user.password != password
      fail! :message => "strategies.password.failed"
    else
      success! user
    end
  end

  private

  def username_password

    return_hash = username_password_from_http

    if return_hash==nil
      return username_password_from_params
    else
      return return_hash
    end

  end

  def username_password_from_http

    auth_header = request.env.select {|k,v| k.start_with? 'HTTP_AUTHORIZATION'}

    auth_field = auth_header['HTTP_AUTHORIZATION']
    if auth_field!=nil && auth_field.start_with?('Basic ')
      auth_data = Base64.decode64( auth_field.sub('Basic ', '') )
      user_array = auth_data.split(':')
      username = user_array[0]
      password = user_array[1]
      return {'username' => username, 'password' => password}
    else
      return nil
    end

  end

  def username_password_from_params
    puts ("PARAMS ARE: #{params}")
    if params!=nil && params['user']!=nil
      username = params['user']['email']
      password = params['user']['password']
      return {'username' => username, 'password' => password}
    else
      return nil
    end
  end

end

Warden::Strategies.add(:password, PasswordStrategy)
