User.destroy_all
["madskillz", "nowyouseemenowyoudont", "judochop", "ryan"].each do |uname|
  u = User.new
  u.username = uname
  u.password = "hockey"
  u.has_ringer = false
  u.save
end
puts "There are now #{User.count} users in the database."


Ringer.destroy_all
preset_ringers = [{  :first => "Joe",
                     :last => "Schmoe",
                     :is_male => true,
                     :comp_level => 11,
                     :city => "Evanston",
                     :state => "IL",
                     :img_url => "/profile-joe-schmoe.jpg",
                     :bio => "I'm a gangsta balla with mad skillz yo. Put me on your team and we'll win every time."
                    },
                  {  :first => "Harry",
                     :last => "Houdini",
                     :is_male => true,
                     :comp_level => 3,
                     :city => "Appleton",
                     :state => "WI",
                     :img_url => "/profile-harry-houdini.jpg",
                     :bio => "I can hold my breath for over 4 minutes. Want to see me escape from a straight jacket?"
                    },
                  {  :first => "Lucy",
                     :last => "Liu",
                     :is_male => false,
                     :comp_level => 8,
                     :city => "Los Angeles",
                     :state => "CA",
                     :img_url => "/profile-lucy-liu.bmp",
                     :bio => "When you work with chains or any kind of weapons, or just when you're using hand-to-hand combat, you are going to get hurt."
                    },
                  {  :first => "Ryan",
                     :last => "Rennaker",
                     :is_male => true,
                     :comp_level => 7,
                     :city => "Kirkland",
                     :state => "WA",
                     :img_url => "/profile-lebron-james.jpg",
                     :bio => "I'm the man with the master plan. And the keys to the database."
                    },
]
preset_ringers.each do |ringer|
  r = Ringer.new
  r.first = ringer[:first]
  r.last = ringer[:last]
  r.is_male = ringer[:is_male]
  r.comp_level = ringer[:comp_level]
  r.city = ringer[:city]
  r.state = ringer[:state]
  r.img_url = ringer[:img_url]
  r.bio = ringer[:bio]

  user = User.where(:has_ringer => false).take!
  r.user_id = user.id
  r.save
  user.has_ringer = true
  user.save
end

puts "There are now #{Ringer.count} ringers in the database."
puts "Users without ringers? There are #{User.where(:has_ringer => false).count} of them."

Sport.destroy_all
["Flag Football", "Basketball", "Softball", "Kickball", "Ultimate Frisbee", "Soccer"].each do |sport|
  s = Sport.new
  s.name = sport
  s.save
end
puts "There are now #{Sport.count} sports in the database."

RingerSport.destroy_all
# Adding Joe's sports (All of them)
ringer = Ringer.where(:first => "Joe").take!
puts "Now creating RingerSports for #{ringer.first}."
allsports = Sport.all
allsports.each do |sport|
  ringersport = RingerSport.new
  ringersport.ringer_id = ringer.id
  ringersport.sport_id = sport.id
  ringersport.save
end

# Adding Harry's sports
ringer = Ringer.where(:first => "Harry").take!
puts "Now creating RingerSports for #{ringer.first}."
ringersport = RingerSport.new
sport = Sport.where(:name => "Softball").take!
ringersport.ringer_id = ringer.id
ringersport.sport_id = sport.id
ringersport.save
ringersport = RingerSport.new
sport = Sport.where(:name => "Kickball").take!
ringersport.ringer_id = ringer.id
ringersport.sport_id = sport.id
ringersport.save

# Adding Lucy's sports
ringer = Ringer.where(:first => "Lucy").take!
puts "Now creating RingerSports for #{ringer.first}."
ringersport = RingerSport.new
sport = Sport.where(:name => "Softball").take!
ringersport.ringer_id = ringer.id
ringersport.sport_id = sport.id
ringersport.save
ringersport = RingerSport.new
sport = Sport.where(:name => "Ultimate Frisbee").take!
ringersport.ringer_id = ringer.id
ringersport.sport_id = sport.id
ringersport.save
ringersport = RingerSport.new
sport = Sport.where(:name => "Soccer").take!
ringersport.ringer_id = ringer.id
ringersport.sport_id = sport.id
ringersport.save

# Adding Ryan's sports
ringer = Ringer.where(:first => "Ryan").take!
puts "Now creating RingerSports for #{ringer.first}."
ringersport = RingerSport.new
sport = Sport.where(:name => "Flag Football").take!
ringersport.ringer_id = ringer.id
ringersport.sport_id = sport.id
ringersport.save
ringersport = RingerSport.new
sport = Sport.where(:name => "Basketball").take!
ringersport.ringer_id = ringer.id
ringersport.sport_id = sport.id
ringersport.save
ringersport = RingerSport.new
sport = Sport.where(:name => "Kickball").take!
ringersport.ringer_id = ringer.id
ringersport.sport_id = sport.id
ringersport.save

puts "There are now #{RingerSport.count} ringer_sports in the database."

