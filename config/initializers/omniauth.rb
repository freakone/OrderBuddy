OmniAuth.config.logger = Rails.logger

if Rails.env.development? 
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENVied.FACEBOOK_APP_ID, ENVied.FACEBOOK_SECRET
end
