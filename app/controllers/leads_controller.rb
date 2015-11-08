class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  def index

  end

  def create
    lead = Lead.new
    lead.name = params[:name]
    lead.last_name = params[:lastName]
    lead.email = params[:email]
    lead.company = params[:company]
    lead.job_title = params[:jobTitle]
    lead.phone = params[:phone]
    lead.website = params[:website]
    lead.status = "New"
    lead.save

    redirect_to '/leadsrd'
  end

  def destroy
    @lead.destroy
    redirect_to '/leadsrd'
  end

  private

    def set_lead
      @lead = Lead.find(params[:id])
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
      helper_method :current_user
end
