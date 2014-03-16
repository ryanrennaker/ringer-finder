class AdminController < ApplicationController

  def display
      @sports = Array.new
      Sport.all.each do |sport|
        count = RingerSport.all.where(:sport_id => sport.id).count
        sport_hash = { :name => sport.name, :id => sport.id, :ringer_count => count}
        @sports.push(sport_hash)
      end


      @ringer_sport_pairs = Array.new
      Ringer.all.each do |r|
        ringersport_ids = Array.new
        ringersports = RingerSport.all.where(:ringer_id => r.id)
          ringersports.each do |rs|
            ringersport_ids.push(rs.id)
          end
        rs_hash = {:ringer => r, :ringersport_ids => ringersport_ids}
        @ringer_sport_pairs.push(rs_hash)
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

  def deleteringer
    ringer_id = params[:ringer_id]
    ringer = Ringer.find_by(:id => ringer_id)

    user = User.find_by(:id => ringer.user_id)
    if user.present?
      user.has_ringer = false
      user.save
    end

    RingerSport.where(:ringer_id => ringer_id).each do |rs|
      rs.destroy
    end
    ringer.destroy

    redirect_to "/admin", notice: "Ringer has been deleted"
  end


end
