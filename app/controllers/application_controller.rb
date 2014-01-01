class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :init_page

  protected

  def require_authentication
    authenticate_user!
  end

  def init_page
    @page = Page.new
  end

end
