class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to new_session_path
    end

    # user = User.find_by_email(params[:email])
    # # If the user exists AND the password entered is correct.
    # if user && user.authenticate(params[:password])
    #   # Save the user id inside the browser cookie. This is how we keep the user
    #   # logged in when they navigate around our website.
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else
    # # If user's login doesn't work, send them back to the login form.
    #   redirect_to '/'
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end