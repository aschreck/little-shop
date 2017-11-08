# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create(name: "Miguel", username: "miguel", password: "password", role: "admin", address: "1234 Rails St")
dolls = Category.create(title: "Haunted Dolls")
dolls.items.create(title: "Rob" , description: "Makes scary sounds in the night while you sleep.", price: 50.0, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Robert_The_Doll_%285999680656%29.jpg/1200px-Robert_The_Doll_%285999680656%29.jpg")
dolls.items.create(title: "Belinda", description: "Her eyes follow you around the room", price: 75.0, image: "https://pbs.twimg.com/profile_images/647637341243224064/Gq601OUn.jpg")
dolls.items.create(title: "Burned Baby", description: "Survived a fire...smoke comes from eyes at night", price: 85.0, image: "http://www.realclearlife.com/wp-content/uploads/2016/10/haunted-doll-3-1026.jpg")
dolls.items.create(title: "Shirley Temple", description: "When left alone, she will sing softly...", price: 125.0, image: "http://thehorrormoviesblog.com/wp-content/uploads/2015/09/Haunted-shirley-temple-doll-1.jpg")
dolls.items.create(title: "Sarah", description: "Previous owners reported eerie church hymns at night", price: 65.0, image: "https://cnet1.cbsistatic.com/img/HZM7T7mYQb7_r1rCh2fssQbnJOc=/fit-in/570x0/2016/10/11/b98c2dd1-8d71-4239-9f5b-1d118e9f926e/haunteddoll.jpg")

category = Category.create(title: "Haunted Houses")
category.items.create(title: "Old Timey Spooky-Scary House", description: "This house is old and also very spooky scary.", price: 10000, image: "https://i.pinimg.com/736x/40/ed/d2/40edd28b7ccfef31846f96a5a0bdcd40--haunted-houses-old-houses.jpg")
category.items.create(title: "Abandoned Old Scary House", description: "This house has been abandoned so enter at your own risk.", price: 25000, image: "https://pbs.twimg.com/profile_images/784976363291676672/AmZEa93y_400x400.jpg")
category.items.create(title: "Murray Family House", description: "This house used to belong to the famous Murray family. Now it is haunted by spooky ghosts. BEWARE!", price: 1200, image: "https://img00.deviantart.net/e8ea/i/2012/284/e/1/haunted_house_2_background_by_moonchild_ljilja-d5hgq0f.jpg")
category.items.create(title: "The Witch of East Something's Mansion", description: "This house used to belong to a witch. It is located in East Something. Which was infamous for being very spooky.", price: 7000, image: "http://www.officialpsds.com/images/stocks/Haunted-House-stock1673-large.png")
category.items.create(title: "House Where Ryan Reynolds Tries To Murder His Family", description: "This house belonged to Ryan Reynolds when he was in that movie where he tried to murder his family. Very spooky and scary.", price: 12000, image: "https://www.salsalabs.com/hs-fs/hubfs/hauntedhouse.jpg?t=1509719784989&width=400&name=hauntedhouse.jpg")

# 10.times do
#   category = Category.create(title: Faker::Company.unique.name)
#   2.times do
#     category.items.create(title: Faker::DragonBall.unique.character , description: "Kinda gross", price: 100.55)
#     category.items.create(title: Faker::FamilyGuy.unique.character, description: "Kinda gross", price: 5.35)
#     category.items.create(title: Faker::Pokemon.unique.name, description: "Kinda gross", price: 10.15)
#     category.items.create(title: Faker::GameOfThrones.unique.character, description: "Kinda gross", price: 24.45)
#     category.items.create(title: Faker::LeagueOfLegends.unique.champion, description: "Kinda gross", price: 3.35)
#     category.items.create(title: Faker::Superhero.unique.name, description: "Kinda gross", price: 50.75)
#   end
# end
