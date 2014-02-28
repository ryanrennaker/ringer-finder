class RingerController < ApplicationController
  def index
    @ringer_list = [{"id" => 1 , "ringer_name" => "Joe Schmoe", "gender" => "Male", "sports" => ["Basketball", "Football"], "comp_level" => "Extreme", "city" => "Evanston, IL"},{"id" => 2, "ringer_name" => "Harry Houdini", "gender" => "Male", "sports" => ["Ultimate Frisbee"], "comp_level" => "Friendly", "city" => "Appleton, WI"},{"id" => 3 , "ringer_name" => "Lucy Liu", "gender" => "Male", "sports" => ["Tennis", "Softball", "Bowling"], "comp_level" => "High", "city" => "Los Angeles, CA"}]
  end

  def show
    @ringer_list = [{"id" => 1 , "ringer_name" => "Joe Schmoe", "gender" => "Male", "sports" => ["Basketball", "Football"], "comp_level" => "Extreme", "city" => "Evanston, IL"},{"id" => 2, "ringer_name" => "Harry Houdini", "gender" => "Male", "sports" => ["Ultimate Frisbee"], "comp_level" => "Friendly", "city" => "Appleton, WI"},{"id" => 3 , "ringer_name" => "Lucy Liu", "gender" => "Male", "sports" => ["Tennis", "Softball", "Bowling"], "comp_level" => "High", "city" => "Los Angeles, CA"}]
    @id = params[:id]
    @id = "1" if @id.nil? || @id.empty? #helpful if query parameter is not set
  end

end
