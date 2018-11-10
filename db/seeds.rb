# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Deleting all ingredients..."
Ingredient.destroy_all

puts "Fetching ingredients from the API..."
ingredient_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(ingredient_url).read
ingredients = JSON.parse(ingredients_serialized)

puts "Creating ingredients..."
ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts "Deleting all cocktails..."
Cocktail.destroy_all

puts "Creating 3 cocktails..."
c1 = Cocktail.create(name: 'Margarita')
c2 = Cocktail.create(name: 'Manhattan')
c3 = Cocktail.create(name: 'French Martini')

