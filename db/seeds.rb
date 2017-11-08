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
dolls.items.create(title: "Rob" , description: "Makes scary sounds in the night", price: 50.0, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Robert_The_Doll_%285999680656%29.jpg/1200px-Robert_The_Doll_%285999680656%29.jpg")
dolls.items.create(title: "Belinda", description: "Her eyes follow you around the room", price: 75.0, image: "https://pbs.twimg.com/profile_images/647637341243224064/Gq601OUn.jpg")
dolls.items.create(title: "Burned Baby", description: "Survived a fire...smoke comes from eyes at night", price: 85.0, image: "http://www.realclearlife.com/wp-content/uploads/2016/10/haunted-doll-3-1026.jpg")
dolls.items.create(title: "Shirley Temple", description: "When left alone, she will sing softly...", price: 125.0, image: "http://thehorrormoviesblog.com/wp-content/uploads/2015/09/Haunted-shirley-temple-doll-1.jpg")
dolls.items.create(title: "Sarah", description: "Previous owners reported eerie church hymns at night", price: 65.0, image: "https://cnet1.cbsistatic.com/img/HZM7T7mYQb7_r1rCh2fssQbnJOc=/fit-in/570x0/2016/10/11/b98c2dd1-8d71-4239-9f5b-1d118e9f926e/haunteddoll.jpg")


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
