# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "\nResolving tasks..."
Game.create(name: "Rune Factory 4 Special", genre: "Role-playing (RPG)", price: 5999, release_date: "2019-07-25")
game = Game.new
game.name = "Borderlands 3"
game.genre = "Simulator"
game.price = 5999
game.release_date = "2019-09-13"
game.save
arr_games = [ {:name=>"Zombie Driver: Immortal Edition", :genre=>"Racing", :price=>5999, :release_date=>"2019-Jul-25"},
    {:name=>"Remnant: From the Ashes", :genre=>"Shooter", :price=>6999, :release_date=>"2019-Aug-20"},
    {:name=>"Monster Hunter: World - Iceborne", :genre=>"Adventure", :price=>6999, :release_date=>"2019-Sep-06"},
    {:name=>"Cyberpunk 2077", :genre=>"Role-playing (RPG)", :price=>4999, :release_date=>"2020-Sep-17"},
    {:name=>"Pokémon Shield", :genre=>"Role-playing (RPG)", :price=>5999, :release_date=>"2019-Nov-15"},
    {:name=>"Children of Morta", :genre=>"Role-playing (RPG)", :price=>6999, :release_date=>"2019-Sep-03"} ]

arr_games.each {|g| Game.create(**g)}

puts "\nTask 2 finished"
puts "\nAll games:"
Game.all.each {|h| puts h.to_json}
puts "\nGame id #4:"
puts Game.find_by(id: 4).to_json
puts "\nGame that was released on 2019-Aug-20:"
puts Game.find_by(release_date: "2019-Aug-20").to_json
puts "\nFirst game:"
puts Game.first.to_json
puts "\nLast game:"
puts Game.last.to_json
puts "\nGames order by release date:"
Game.order(:release_date).each {|h| puts h.to_json}
puts "\nGames that cost $59.99:"
Game.where(price: 5999).each {|h| puts h.to_json}
puts "\nGames that were released in 2019:"
Game.where('extract(year from release_date) = ?', 2019).each {|h| puts h.to_json}
puts "\nTask 3 finished"


game = Game.find_by(name: 'Borderlands 3')
game.genre = 'Shooter'
game.save

game = Game.find_by(name: 'Pokémon Shield')
game.update(price: 3999)

Game.where(genre: "Role-playing (RPG)").update_all "price = 2999"

puts "\nUpdated games:"
Game.all.each {|h| puts h.to_json}

puts "\nTask 4 finished"

game = Game.find_by(id: 3)
game.destroy
puts "\nGame #3 destroyed:"
Game.all.each {|h| puts h.to_json}

Game.destroy_by(genre: 'Adventure')
puts "\nAdventure games destroyed:"
Game.all.each {|h| puts h.to_json}

puts "\nAll games destroyed:"
Game.destroy_all

puts "\nTask 5 finished"
