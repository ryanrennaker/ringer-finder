class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:first_name => params[:fname])
      if user.present?
        if user.password == params[:pwd]
          session[:user_id] = user.id
          redirect_to root_url, notice: "Hello there!"
        else
          redirect_to root_url, notice: "Invalid login"
        end
    else
     redirect_to root_url, notice: "Nice Try!"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "You have been logged out"
  end

end
