class HomeController < ApplicationController
  def index

  #  @leads = []

  #  if current_user

  #      client = Restforce.new :api_version => "32.0", :oauth_token => current_user.oauth_token,
  #        :refresh_token => current_user.refresh_token,
  #        :instance_url  => current_user.instance_url,
  #        :client_id     => '3MVG9KI2HHAq33RxE3uJ6fN7r8Ni2mAGzpVhlQeKePV7GxYdNGe65yXkxVk',
  #        :client_secret => '915198885628210263'

         #@newLead = client.create('Lead', FirstName: 'Daniel', MiddleName: 'Oliveira', LastName: 'Filho', Status: 'New', Company: 'xdd');

  #       @leads = client.query("select id, name, status, company from Lead");

    #end

  end

  def about
  end

  def leads
    @leads = "Lista de Leads"

  end

  private
  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    helper_method :current_user

end
