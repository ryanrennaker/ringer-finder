User.destroy_all
["Jeff", "Brian"].each do |name|
  u = User.new
  u.first_name = name
  u.password = "hockey"
  u.save
end

puts "There are now #{User.count} users in the database."


Category.destroy_all
["Toys", "Electronics", "Furniture", "Other"].each do |category_name|
  c = Category.new
  c.name = category_name
  c.save
end


Item.destroy_all
product_catalog = [ { :name => "Helicopter Toy",
                      :category_name => 'Toys',
                      :price => 299,
                      :image_url => 'http://ecx.images-amazon.com/images/I/61l6Rcyy1sL._SL1500_.jpg',
                      :description => "This Brand New 3 Channel mini rc helicopter is the world's newest, most durable and stable helicopter. The item comes with the latest gyro system for precision control. The metal frame has proven to withstand dozens of crashes. The mini helicopter charges directly from the controller which uses AA batteries and has a full-function trim control for the perfect flight. Get one today before they all fly away! The Syma S107 metal frame series with gyroscope takes indoor flying to the next level through precision control. It is extremely easy to fly and durable. This is highly recommended for beginners. No flight training necessary.",
                    },
                    { :name => "Ticket to Ride",
                      :category_name => 'Toys',
                      :price => 38,
                      :image_url => 'http://ecx.images-amazon.com/images/I/61dDQUfhuvL._SX450_.jpg',
                      :description => "October 2, 1900 - it's 28 years to the day that noted London eccentric, Phileas Fogg accepted and then won a bet that he could travel \"Around the World in 80 Days.\" Now, at the dawn of the century, some old friends have gathered to celebrate Fogg's impetuous and lucrative gamble - and to propose a new wager of their own. The stakes: $1 million in a winner-takes-all competition. The objective: to see the most cities in North America - in just 7 days. Ticket to Ride is a cross-country train adventure game. Players collect train cards that enable them to claim railway routes connecting cities throughout North America. The longer the routes, the more points they earn. Additional points come to those who can fulfill their Destination Tickets by connecting two distant cities, and to the player who builds the longest continuous railway. For 2 to 5 players ages 8 and older. Playing time: 30-60 minutes. Comes with: 1 Board map of North American train routes, 240 Colored Train Cars, 110 Train Car cards, 30 Destination Tickets, 5 Wooden Scoring Markers, 1 Days of Wonder Online access number, and a Rules booklet.",
                    },
                    { :name => "Rubik's Cube",
                      :category_name => 'Toys',
                      :price => 38,
                      :image_url => 'http://ecx.images-amazon.com/images/I/81%2BriieG%2BQL._SL1500_.jpg',
                      :description => "The world's No.1 brain-teasing puzzler is still going strong with billions of puzzling combinations, but only one solution -- and it's harder than it looks! This classic and super-addictive game puts your skills to the test to see if you can make each of the sides into a solid color. Scramble the colored squares on this 3-inch by 3-inch puzzle cube. Then twist, turn, and rotate to match up the colors again on all nine sides! Can you master the mysteries of the Rubik's Cube?",
                    },
                    { :name => "Harry Potter",
                      :category_name => 'Other',
                      :price => 6,
                      :image_url => "http://ecx.images-amazon.com/images/I/51MU5VilKpL.jpg",
                      :description => "Harry Potter has no idea how famous he is. That's because he's being raised by his miserable aunt and uncle who are terrified Harry will learn that he's really a wizard, just as his parents were. But everything changes when Harry is summoned to attend an infamous school for wizards, and he begins to discover some clues about his illustrious birthright. From the surprising way he is greeted by a lovable giant, to the unique curriculum and colorful faculty at his unusual school, Harry finds himself drawn deep inside a mystical world he never knew existed and closer to his own noble destiny."
                    },
                    { :name => "iPhone 5s",
                      :category_name => 'Electronics',
                      :price => 299,
                      :image_url => "http://images.apple.com/iphone-5s/specs/images/color_gray.jpg",
                      :description => "A chip with 64-bit architecture. A fingerprint identity sensor. A better, faster camera. And an operating system built specifically for 64-bit. Any one of these features in a smartphone would make it ahead of its time. All of these features in a smartphone make it an iPhone that's definitely ahead of its time."
                    },
                    { :name => "Sofa",
                      :category_name => 'Furniture',
                      :price => 370,
                      :image_url => "http://ecx.images-amazon.com/images/I/91G2Gn8AihL._SL1500_.jpg",
                      :description => "For more than 75 years, Serta has been an industry leader in comfort products worldwide. That tradition of innovation and quality continues today. From a brand that is synonymous with quality, comfort and style, the Serta Santa Cruz Collection Sofa offers many attractive features that you're going to love. Starting with its Tool-free EZ assembly, which is the most convenient and stress free on the market today. This product goes from box to built in mere minutes. But that's just the beginning, this sofa is generous and comfortable as well. In fact, you might find it a great place for a nap. Here's why: Starting from the ground up, you have a solid stance on real wood legs. Next, the lower foundation is constructed with hardwood materials and the tried and true method of mechanically fastened and glued hardwood plywood corner blocks that reinforce the frame and sturdiness, along with track style arms with corrugated reinforced outer-sides. Attached to that are heavy-duty 8 gauge anti-sag sinuous springs secured and joined with a double row of tie wire. This forms a comfortable, supportive and lasting seating structure. Resting upon this are seat cushions with rows of individually pocketed comfort coils surrounded by high density seating foam, and premium quality poly-fibers on top. This cushion system forms the basis of our sit down, and sink in feel. Behind that you have the upper structure which consists of more hardwood material and a matrix of non-woven strapping that form a dense and sturdy back structure. In front of that are the pillowed back cushions. These consist of an inner poly-fiber core contained in a non-woven cover to help maintain shape and density. Wrap the whole thing in a lush and luxurious 100-Percent polyester Platinum Fabric and you have a gorgeous piece for any living space. 1 year limited warranty. Product assembly is required. Designed in the USA. Manufacturer style number is CR-43534 ."
                    },
                    { :name => "Coffee Mug",
                      :category_name => 'Other',
                      :price => 8,
                      :image_url => "http://ecx.images-amazon.com/images/I/61jhb2P56cL._SL1500_.jpg",
                      :description => 'Whet your appetite with the Morning Mug, a playful porcelain coffee cup that actually perks up as you do. Simply pour in hot coffee or tea and watch the face go from fast asleep to up-and-at-em. Part of the The Cottage Industry\'s thermochromic collection, this clever cup mimics the uplifting effect of the beverage within.'
                    }
                  ]

product_catalog.each do |product_info|
  p = Item.new
  p.name = product_info[:name]
  p.price = product_info[:price]
  p.image_url = product_info[:image_url]
  p.description = product_info[:description]

  category = Category.find_by(:name => product_info[:category_name])
  p.category_id = category.id
  p.save
end

puts "There are now #{Item.count} products in the catalog."

Review.destroy_all
some_item = Item.order('name').first
review = Review.new
review.item_id = some_item.id
review.title = "Not bad"
review.rating = 3
review.user_id = User.first.id
review.body = "I don't think this product is all that bad actually.  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
review.save

review = Review.new
review.item_id = some_item.id
review.title = "Awesomesauce!"
review.rating = 5
review.user_id = User.last.id
review.body = "Amazing!  You should order one right now!  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
review.save

review = Review.new
review.item_id = some_item.id
review.title = "Pretty Good"
review.rating = 4
review.user_id = User.first.id
review.body = "Definitely recommended but don't expect miracles.  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
review.save




puts "There are now #{Review.count} reviews."
