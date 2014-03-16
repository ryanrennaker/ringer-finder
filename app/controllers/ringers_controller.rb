class RingersController < ApplicationController

  def list
    if params[:sport].present?
      filter_sport = Sport.find_by(:name => params[:sport].gsub("-", " "))
      ringersport_list = RingerSport.all.where(:sport_id => filter_sport.id)
      @ringer_sport_pairs = Array.new
      ringersport_list.each do |ringersport|
          r = Ringer.find_by(:id => ringersport.ringer_id)
          s = Array.new
          rs_by_ringer = RingerSport.all.where(:ringer_id => r.id)
          rs_by_ringer.each do |rs|
            sport_name = Sport.find_by(:id => rs.sport_id).name
            s.push(sport_name)
          end
          rs_hash = { :ringer => r, :sports => s}
          @ringer_sport_pairs.push(rs_hash)
      end
      @ringer_sport_pairs = @ringer_sport_pairs.sort_by { |hash| hash[:ringer][:first] }
    else
      everyone = Ringer.all
      @ringer_sport_pairs = Array.new
      everyone.each do |r|
        s = Array.new
        ringersport_list = RingerSport.all.where(:ringer_id => r.id)
        ringersport_list.each do |rs|
          sport_name = Sport.find_by(:id => rs.sport_id).name
          s.push(sport_name)
        end
        rs_hash = { :ringer => r, :sports => s}
        @ringer_sport_pairs.push(rs_hash)
      end
      @ringer_sport_pairs = @ringer_sport_pairs.sort_by { |hash| hash[:ringer][:first] }
    end
  end

  def show
    if params[:ringer_id].present?
      id = params[:ringer_id]
    else
      id = Ringer.first[:id]
    end
    r = Ringer.find_by(:id => id)
    s = Array.new
    ringersport_list = RingerSport.all.where(:ringer_id => r.id)
    ringersport_list.each do |rs|
      sport_name = Sport.find_by(:id => rs.sport_id).name
      s.push(sport_name)
    end
    @rs_hash = { :ringer => r, :sports => s}
  end

  def create
    ringer = Ringer.new
    ringer.first = params[:first]
    ringer.last = params[:last]
    if params[:gender]=="Male"
      ringer.is_male = true
    else
      ringer.is_male = false
    end
    ringer.comp_level = params[:comp_level].to_i
    ringer.city = params[:city]
    ringer.state = params[:state]
    ringer.bio = params[:bio]

    user = User.find_by(:id => session[:user_id])
    ringer.user_id = user.id
    ringer.save
    user.has_ringer = true
    user.save

    params[:sport].each do |s|
      ringersport = RingerSport.new
      ringersport.ringer_id = Ringer.find_by(:user_id => session[:user_id]).id
      ringersport.sport_id = s
      ringersport.save
    end

    usershowpage = "/users/"+session[:user_id].to_s+"/show"
    redirect_to usershowpage, notice: "Profile created"
  end

  def update
    ringer = Ringer.find_by(:id => params[:ringer_id])
    ringer.first = params[:first]
    ringer.last = params[:last]
    if params[:gender]=="Male"
      ringer.is_male = true
    else
      ringer.is_male = false
    end
    ringer.comp_level = params[:comp_level].to_i
    ringer.city = params[:city]
    ringer.state = params[:state]
    ringer.img_url = params[:img_url]
    ringer.bio = params[:bio]
    ringer.save

    ringer_id = Ringer.find_by(:user_id => session[:user_id]).id

    # Sync up the sports the user checked with what's in the DB

    #Destroy old RingerSport entries (we'll create new ones)
    RingerSport.where(:ringer_id => ringer_id).each do |rs|
      rs.destroy
    end

    # Create new RingerSport entries
    params[:sport].each do |s|
      ringersport = RingerSport.new
      ringersport.ringer_id = ringer_id
      ringersport.sport_id = s
      ringersport.save
    end

    usershowpage = "/users/"+session[:user_id].to_s+"/show"
    redirect_to usershowpage, notice: "Profile updated"
  end

end

