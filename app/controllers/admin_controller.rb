class AdminController < ApplicationController

  def sports
      @sports = Array.new
      Sport.all.each do |sport|
        count = RingerSport.all.where(:sport_id => sport.id).count
        sport_hash = { :name => sport.name, :id => sport.id, :ringer_count => count}
        @sports.push(sport_hash)
      end
  end


  def addsport
      newsport = Sport.new
      newsport.name = params[:sport_name]
      newsport.save

      redirect_to "/admin", notice: "Sport has been added"
  end


  def deletesport
      RingerSport.all.where(:sport_id => params[:sport_id]).each do |rs_to_delete|
        rs_to_delete.destroy
      end
      Sport.find_by(:id => params[:sport_id]).destroy

      redirect_to "/admin", notice: "Sport has been deleted"
  end


end
