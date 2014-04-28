class UsersController < ApplicationController

  def index
    
  end

  def login_as(email, password)
#    @user = @user_identity.user
#    session[:impersonation_user_identity_id] = @user_identity.id
#    session[:impersonator_id] = current_user_identity.id
    @session = User::Session.new @user
  	session[:current_email] = @session.email
  	session[:current_password] = @session.password
  end

  def logout_as
  end

  def new
    @user = User.new
    @user.firstname = session[:current_firstname]
    @user.lastname = session[:current_lastname]
    @user.email = session[:current_email]
    @user.password = session[:current_password]
  end

  def create
    @user = User.new(params[:users])
    require 'debugger'; debugger
    if @user.save
      flash[:positive] = "Registration Successful"
      redirect_to root_path
    else
      flash[:negative] = "Incorrect Registration Information."
      render :action => "new"
    end
  end

end
