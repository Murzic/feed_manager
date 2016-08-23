class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  
  def authenticate_user!
    unless session[:user_id]
      flash[:danger] = "You must authenticate"
      redirect_to sign_in_path
    end
  end
end
