class LoginsController < ApplicationController
  before_action :set_page_title

  # GET /logins
  def index
    @login = Login.new( email: cookies[:useremail] ) if cookies[:useremail]
    @login = Login.new unless cookies[:useremail]
  end

  def dologin
    @login = Login.new login_params
    user = @login.authenticate
    if user
      if user.ustatus == 'active'
        session[:user] = user.attributes.symbolize.only(:id, :name, :email, :utype, :ustatus, :organization_id)
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

  def set_page_title
    content_for :page_title, t(:login_page_title)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params[:login]
    end
end
