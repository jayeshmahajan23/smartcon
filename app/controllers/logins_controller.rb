class LoginsController < ApplicationController
  skip_before_action :require_login

  # GET /logins
  def index
    redirect_to '/dashboard' if logged_in?
    @login = Login.new( email: cookies[:useremail] ) if cookies[:useremail]
    @login = Login.new unless cookies[:useremail]
  end

  def dologin
    redirect_to '/dashboard' if logged_in?
    @login = Login.new login_params
    user = @login.authenticate
    if user
      if user.ustatus == 'active' && user.organization.ostatus == 'active'
        set_session_data :user, user.attributes.symbolize.only(:id, :name, :email, :utype, :ustatus, :time_zone)
        set_session_data :organization, user.organization.attributes.symbolize.only(:id, :name, :otype, :organization_id)
        if login_params[:remember] == "1"
          cookies[:useremail] = { :value => login_params['email'], :expires => 2.years.from_now }
        else
          cookies.delete :useremail
        end
        user.update_login_records request.remote_ip
        redirect_to '/dashboard' and return
      else
        flash.now[:error] = t(:inactive_account)
      end
    else
      flash.now[:error] = t(:invalid_login)
    end
    render action: :index
  end

  def destroy
    reset_session
    redirect_to '/login'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params[:login]
    end

    def set_page_title
      content_for :page_title, t(:login_page_title)
    end
end
