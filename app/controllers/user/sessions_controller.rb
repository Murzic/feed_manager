class User::SessionsController < ApplicationController
  def new
    redirect_to root_path if signed_in?
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      login @user
      redirect_to root_path
    else
      render :new, status: 401
    end
  end

  def destroy
    logout
    redirect_to root_path    
  end
end
