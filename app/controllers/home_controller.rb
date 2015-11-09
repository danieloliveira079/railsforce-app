class HomeController < ApplicationController
    before_action :set_client, only: [:leadsforce, :salesforce]
  def index
    @appSettings = AppSetting.all
  end

  def about
  end

  def leadsrd
    @leadsrd = Lead.all
  end

  def leadsforce
    if current_user
       @leadsforce = @client.query("select id, firstname, middlename , lastname, status, company, email, website, phone, title from Lead");
    end
  end

  def salesforce
    if current_user

      @params = params[:lead_id]
      @totalImported = 0

        if @params != nil
            @params.each do |p|
              lead = Lead.find_by(id: p)
              newLead = @client.create('Lead',
                  FirstName: lead.name,
                  MiddleName: '',
                  LastName: lead.last_name,
                  Status: 'New',
                  Company: lead.company,
                  Email: lead.email,
                  Website: lead.website,
                  Phone: lead.phone,
                  Title: lead.job_title);
                  @totalImported += 1
            end
        end

       @leads = @client.query("select id, firstname, middlename , lastname, status, company, email, website, phone, title from Lead");
    end
  end

  private
  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    helper_method :current_user

  def set_client
    appSettings = AppSetting.where(active:true).take

    @client = Restforce.new :api_version => "32.0", :oauth_token => current_user.oauth_token,
      :refresh_token => current_user.refresh_token,
      :instance_url  => current_user.instance_url,
      :client_id     => appSettings.client_id,
      :client_secret => appSettings.client_secret
  end
end
