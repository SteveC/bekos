# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Language.find_or_create_by! code: 'en', name: 'English'
Language.find_or_create_by! code: 'fe', name: 'French'
Language.find_or_create_by! code: 'de', name: 'German'
Language.find_or_create_by! code: 'ru', name: 'Russian'
Language.find_or_create_by! code: 'cn', name: 'Chinese'

User.find_or_create_by!(login: 'steve') { _1.first_name = 'Steve'; _1.last_name = 'Jobs';  _1.password = '123456'; _1.language_codes = %w[en de ru] }
User.find_or_create_by!(login: 'bill')  { _1.first_name = 'Bill';  _1.last_name = 'Gates'; _1.password = '123456'; _1.language_codes = %w[en de ru] }
