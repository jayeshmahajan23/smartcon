class DashboardsController < ApplicationController

  # GET /dashboards
  def index
    @expiration_msg = nil
    org = Organization.find_by id: session[:organization][:id]
    if org.subscription_expires_at
      diff = org.subscription_expires_at.to_time - Time.now
      @expiration_msg = if diff.between?(1.days,8.days)
        t(:subscription_expiration_warning_html, date: sc_date_with_time(org.subscription_expires_at) )
      elsif condition diff.between?(1..1.days)
        t(:subscription_expiration_warning_today_html)
      else
        t(:expired_subscription_flash_message_html, date: sc_date_with_time(org.subscription_expires_at) )
      end
    end
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
