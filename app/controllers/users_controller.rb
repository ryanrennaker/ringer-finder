class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find_by(:id => params[:user_id])
    if @user.id != session[:user_id]
      redirect_to root_url, notice: "Hacking attempt failed"
    end
  end
end
