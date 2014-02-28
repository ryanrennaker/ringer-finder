class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:first_name => params[:fname])
      if user.present?
        if user.password == params[:pwd]
          session[:user_id] = user.id
          usershowpage = "/users/"+user.id.to_s+"/show"
          redirect_to usershowpage, notice: "Login successful"
        else
          redirect_to "/login", notice: "Invalid login"
        end
    else
     redirect_to "/login", notice: "Invalid login"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Log out successful"
  end

end
