Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '846088225414222', 'c4077e23e4bf34de03417846d8d483bf'
end