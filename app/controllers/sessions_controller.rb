class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path
  end
   def new
    @user = User.new
  end
end
