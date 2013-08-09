class DashboardsController < ApplicationController

  # GET /dashboards
  def index
    @org = Organization.find_by id: session[:organization][:id]
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
