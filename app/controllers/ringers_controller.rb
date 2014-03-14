class RingersController < ApplicationController

  def index
    if params[:sport].present?
      filter_sport = Sport.find_by(:name => params[:sport])
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

end

