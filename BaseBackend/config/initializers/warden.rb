# application.rb
    Warden::Manager.serialize_into_session do |resource|
      resource.id
    end

    Warden::Manager.serialize_from_session do |id|
      puts "GETTING USER FROM SESSION WOOOOO"
      User.find_by_id(id)
    end

    # Warden::Manager.serialize_from_session(:content_provider) do |id|
    #   ContentProvider.find_by_id(id)
    # end

    Rails.application.config.middleware.insert_after ActionDispatch::Flash, Warden::Manager do |manager|
      manager.default_strategies :password, :token
      manager.failure_app = UnauthorizedController
    end