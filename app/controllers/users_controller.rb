class UsersController < ApplicationController

  def new

  end

  def create
    user = User.new
    user.username = params[:uname]
    user.password = params[:pwd]
    user.has_ringer = false
    user.save
    user = User.find_by(:username => params[:uname])
    session[:user_id] = user.id

    usershowpage = "/users/"+user.id.to_s+"/show"
    redirect_to usershowpage, notice: "Your account has been created. Please fill out your profile."
  end

  def show
    @user = User.find_by(:id => params[:user_id])
    if @user.id != session[:user_id]
      redirect_to root_url, notice: "Hacking attempt failed"
    end

    @sports = Array.new
    Sport.all.each do |sport|
      sport_hash = { :name => sport.name, :id => sport.id}
      @sports.push(sport_hash)
    end

    #Pulls in previous settings if already initialized
    if @user.has_ringer
      @ringer = Ringer.find_by(:user_id => @user.id)
      if @ringer.is_male
        @gender="Male"
      else
        @gender="Female"
      end

      @sport_ids_for_this_ringer = Array.new
      RingerSport.all.where(:ringer_id => @ringer.id).each do |ringersport|
        @sport_ids_for_this_ringer.push(ringersport.sport_id)
      end

    end
  end

  def delete
    user = User.find_by(:id => session[:user_id])
    user.destroy
    reset_session
    redirect_to root_url, notice: "Your account information has been deleted"
  end


end
