class DashboardsController < ApplicationController

  # GET /dashboards
  def index
    @org = Organization.find_by id: session[:organization][:id]
    @exp_date = @org.subscription_expires_at ? sc_date_with_time(@org.subscription_expires_at) : nil
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_params
      params[:dashboard]
    end

    def set_page_title
      content_for :page_title, t(:dashboard_page_title)
    end
end
