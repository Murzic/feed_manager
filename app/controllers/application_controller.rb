class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include User::SessionsHelper

  protected
  
  def authenticate_user!
    unless signed_in?
      flash[:danger] = "You must authenticate"
      redirect_to sign_in_path
    end
  end
end
