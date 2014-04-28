class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_session, :current_user

  private

  def current_user
  	#return session[:email_address]
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  def current_user_session
  	require 'debugger'; debugger
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = User::Session.find
  end
end
