# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(email: '22maniaco@uol.com', name: 'maniaco', phone: '1234567', password: 'banana')

Bootcamp.create!(name: 'EletronGames Lan House', address: 'R. Augusta, 612', price: 15, pc_number:'5', photos:"<%= image_path('pcsetup2.jpg')%>", user: user)
Bootcamp.create!(name: 'Lan House Cyber Galaxy', address: 'R. Francisco Calado, 121 - Jardim Centenario', price: 20, user: user)
