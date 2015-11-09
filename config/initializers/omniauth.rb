OmniAuth.config.logger = Rails.logger

  appSettings = AppSetting.where(active:true).take

  if appSettings

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :salesforce, appSettings.client_id, appSettings.client_secret
    end

  else
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :salesforce, '', ''
    end
  end
