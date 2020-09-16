# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do 
    Card.create(
        name: Faker::Games::WarhammerFantasy.creature,
        cost: rand(0..10)
        image: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/035aab8886b98a7572c1da379210c53b12fae1b02254c86c539adc2fe2cfd661.png"
        attack: rand(0..12)
        defense: rand(1..12)
    )
end