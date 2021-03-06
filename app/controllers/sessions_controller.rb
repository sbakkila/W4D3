class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
    params[:user][:user_name],
    params[:user][:password]
    )


    if user.nil?
      #do something with flash for errors

      render :new

    else
      login_user!(user)
      # log_in(user)
      # session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    end
  end

  def destroy
    if !!current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
  end

end
