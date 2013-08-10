class ApplicationController < ActionController::Base
  include SCUtilities

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale, :require_login, :set_page_title, :set_time_zone

  def logged_in?
    (session[:user][:id] rescue nil) ? true : false
  end

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

  # Better to at least pass ltype, some_id, detail
  def record data
    default = { user_id: nil, ip_address: request.remote_ip,
      some_id: nil, ltype: nil, detail: nil }
    default[:user_id] = session[:user][:id] if session[:user][:id] && !default[:user_id]
    data = default.merge(data)
    Log.new(data).save
  end

  private
    def require_login
      unless logged_in?
        flash[:error] = t(:must_login)
        redirect_to '/login'
      end
    end

    def set_page_title
      content_for :page_title, t(:default_page_title)
    end

    def set_time_zone
      Time.zone = session[:user][:time_zone] if session[:user]
    end

    def set_locale
      I18n.locale = session[:locale] || I18n.default_locale
    end

end