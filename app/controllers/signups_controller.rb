class SignupsController < ApplicationController
  before_action :set_page_title

  # TODO: Implement recaptcha https://github.com/ambethia/recaptcha/

  # POST /signup
  def create
    @signup = Signup.new signup_params
    if @signup.valid? && @signup.save
      flash[:success] = t(:signup_success, email: signup_params[:email])
    else
      flash[:error] = t(:generic_error_message)
    end
    render action: :new
  end

  # GET /signup
  def new
    @signup = Signup.new
  end

  def set_page_title
    content_for :page_title, t(:signup_page_title)
  end

  private
    def signup_params
      params[:signup]
    end

end