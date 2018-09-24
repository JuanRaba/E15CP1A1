class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to new_session_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.nil?
      redirect_to new_session_path, alert: 'el usuario no existe'
      return
    end
  
    if @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_session_path, alert: 'el password no es valido'
    end
  end
end
