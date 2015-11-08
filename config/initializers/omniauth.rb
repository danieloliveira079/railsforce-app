OmniAuth.config.logger = Rails.logger

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :salesforce, ENV['SALESFORCE_PROVIDER_ID'], ENV['SALESFORCE_PROVIDER_SECRET']
  end
