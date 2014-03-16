class SessionsController < ApplicationController
  def new
    if session[:user_id].present?
      usershowpage = "/users/"+session[:user_id].to_s+"/show"
      redirect_to usershowpage
    end
  end

  def create
    user = User.find_by(:username => params[:uname])
      if user.present?
        if user.password == params[:pwd]
          session[:user_id] = user.id
          usershowpage = "/users/"+user.id.to_s+"/show"
          redirect_to usershowpage, notice: "Login successful"
        else
          redirect_to "/login", notice: "Invalid login"
        end
    else
     redirect_to "/login", notice: "Unknown user"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Log out successful"
  end

end
