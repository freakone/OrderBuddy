OmniAuth.config.logger = Rails.logger

if Rails.env.development? 
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "891559587576698", "605ab81d2ad8dd56faf18ce9dcf6f710"
end
