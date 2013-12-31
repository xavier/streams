class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def user_authenticated?
    false
  end

  def require_authentication
    forbid_access and return false unless user_authenticated?
  end

  def forbid_access
    render text: "Forbidden", status: :forbidden
  end

end
