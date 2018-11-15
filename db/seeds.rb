# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'NP Online Admin', email: 'nathaniel.pautzke@gmail.com', password: 'Zbz5S7fd%uv!', password_confirmation: 'Zbz5S7fd%uv!',
            admin: true)
