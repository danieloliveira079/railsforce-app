class AppsettingsController < ApplicationController
  before_action :set_appsetting, only: [:show, :edit, :update, :destroy]

  def create
    app = AppSetting.new
    app.client_email = params[:email]
    app.client_id = params[:inputId]
    app.client_secret = params[:inputSecret]
    app.active = false
    app.save

    redirect_to root_path
  end

  def active
    active = AppSetting.update_all active:false

    app = AppSetting.find(params[:accountid])
    app.active = true;
    app.save

    redirect_to '/auth/salesforce'
  end

  private

    def set_appsetting
      @lead = AppSetting.find(params[:id])
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
      helper_method :current_user
end
