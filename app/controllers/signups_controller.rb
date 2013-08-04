class SignupsController < ApplicationController
  skip_before_action :require_login

  # TODO: Implement recaptcha https://github.com/ambethia/recaptcha/

  # POST /signup
  def create
    redirect_to '/dashboard' if logged_in?
    @signup = Signup.new signup_params
    if @signup.valid? && @signup.save
      flash.now[:success] = t(:signup_success, email: signup_params[:email])
    else
      flash.now[:error] = t(:generic_error_message)
    end
    render action: :new
  end

  # GET /signup
  def new
    redirect_to '/dashboard' if logged_in?
    @signup = Signup.new
  end

  private
    def signup_params
      params[:signup]
    end

    def set_page_title
      content_for :page_title, t(:signup_page_title)
    end
end