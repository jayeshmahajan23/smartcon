class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale, :require_login, :set_page_title

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def logged_in?
    (session[:user][:id] rescue nil) ? true : false
  end

  #data should be hash
  def set_session_data key, value
    session[key] = value
  end

  # for setting some value in controller (such as title, meta description etc.)
  # https://gist.github.com/hiroshi/985457
  def view_context
    super.tap do |view|
      (@_content_for || {}).each do |name, content|
        view.content_for name, content
      end
    end
  end

  def content_for name, content # no blocks allowed yet
    return nil unless name
    @_content_for ||= {}
    if @_content_for[name].respond_to?(:<<)
      @_content_for[name] << content
    else
      @_content_for[name] = content
    end
  end

  def content_for?(name)
    @_content_for[name].present?
  end

  private
    def current_user
      @_current_user ||= session[:user][:id] && User.find(session[:user][:id])
    end

    def require_login
      unless logged_in?
        flash[:error] = t(:must_login)
        redirect_to '/login'
      end
    end

    def set_page_title
      content_for :page_title, t(:default_page_title)
    end

end