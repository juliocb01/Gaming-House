# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(email: 'regina123@test.com', name: 'sorriso', phone: '1234567', password: 'banana')

Bootcamp.create!(name: 'EletronGames Lan House', address: 'R. Augusta, 612', price: 15, user: user)
Bootcamp.create!(name: 'Lan House Cyber Galaxy', address: 'R. Francisco Calado, 121 - Jardim Centenario', price: 20, user: user)
Bootcamp.create!(name: 'LAN HOUSE QUEST', address: 'R. Voluntários da Pátria, 3116 - Santana', price: 18, user: user)
Bootcamp.create!(name: 'Lan House Condessa', address: 'R. Condessa de São Joaquim, 249 - loja 04 - Bela Vista', price: 12, user: user)
Bootcamp.create!(name: 'ROMA - Lan house', address: 'R. Frederico Abranches, 445 - Santa Cecilia', price: 15, user: user)
