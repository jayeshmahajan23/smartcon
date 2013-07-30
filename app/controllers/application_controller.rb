class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
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

end
