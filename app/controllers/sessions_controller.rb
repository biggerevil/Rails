class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.find_by(mail: params[:mail])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:target_path) || root_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
