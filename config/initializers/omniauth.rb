OmniAuth.config.logger = Rails.logger

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :salesforce, '', '', :setup => true
    end
