OmniAuth.config.logger = Rails.logger

  #appSettings = AppSetting.where(active:true).take

  Rails.application.config.middleware.use OmniAuth::Builder do
  #  provider :salesforce, appSettings.client_id, appSettings.client_secret
    provider :salesforce, '', ''
  end
