require 'salesforce_rdstation'

class HomeController < ApplicationController
    before_action :set_client_config, only: [:leadsforce, :salesforce]
    before_action :set_run, only: [:index, :login]

  def index

  end

  def login
    if params[:text] == "rdtest@demo.com" && params[:pwd] == "rd2015"
      session[:authenticated] = true
      redirect_to root_path
    else
      @err = "The email and password that you entered don't match."
      render 'home/index'
    end
  end

  # GET - List all Leads from DB "Imported from RD Station"
  def leadsrd
    @leadsrd = Lead.all
  end

  # GET - List all Leads from Salesforce using salesforce_rdstation gem
  def leadsforce
    if current_user
       @leadsforce = @client.getAllLeads
    end
  end

  #POST - Submit all selected Leads from RD Station to SalesForce using salesforce_rdstation gem
  def salesforce
    if current_user

      @params = params[:lead_id]
      @totalImported = 0

        if @params != nil
            @params.each do |p|
              lead = Lead.find_by(id: p)
              payload = {
                :name => lead.name,
                :middleName => "",
                :lastName => lead.last_name,
                :status => "New",
                :company => lead.company,
                :email => lead.email,
                :website => lead.website,
                :phone => lead.phone,
                :jobTitle => lead.job_title
              }
              newLead = @client.create(payload)
              @totalImported += 1
            end
        end

       @leads = @client.getAllLeads
    end
  end

  private
  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    helper_method :current_user

  def set_client_config
    appSettings = AppSetting.where(active:true).take

    client_keys = {
       "api_version" => "32.0",
       "oauth_token" => current_user.oauth_token,
       "refresh_token" => current_user.refresh_token,
       "instance_url" => current_user.instance_url,
       "client_id" => appSettings.client_id,
       "client_secret" => appSettings.client_secret
     }
     @client = Salesforce::Lead.new(client_keys)
  end

  def set_run
      @authenticated = session[:authenticated]

      # Get all stored accounts from DB
      @appSettings = AppSetting.order(:id)
  end
end
