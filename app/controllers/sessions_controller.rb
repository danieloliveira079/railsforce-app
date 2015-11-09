class SessionsController < ApplicationController
    def create
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_url
    end

    def setup
      appsettings = AppSetting.where(active:true).take
      request.env['omniauth.strategy'].options[:client_id] = appsettings.client_id
      request.env['omniauth.strategy'].options[:client_secret] = appsettings.client_secret
      render :text => "Omniauth setup phase.", :status => 404
    end

    def changeaccount
      session[:user_id] = nil
      redirect_to root_url
    end

    def destroy
      session[:authenticated] = false
      redirect_to root_url
    end
  end
