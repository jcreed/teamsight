class SessionsController < ApplicationController

  def new
    @session = User::Session.new
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
  end

  def create
    @session = User::Session.new(params[:user_session])
#    sign_in_as params[:session]
    if @session.save
      flash[:positive] = "Logged in successfully"
      redirect_back_or_default(root_path)
    else
      flash[:negative] = "Incorrect login details."
      render :action => "new"
    end
  end

  def destroy
    current_user_session.destroy
    # session[:impersonation_user_identity_id] = nil
    # session[:impersonator_id] = nil
    flash[:positive] = "Logout successful!"
    redirect_back_or_default new_session_url
  end
end