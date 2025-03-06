# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

10.times do
  Movie.create!(
    title: Faker::Movie.title,
    overview: Faker::Lorem.sentence(word_count: 10),
    poster_url: "https://source.unsplash.com/300x400/?movie,cinema",
    rating: rand(5.0..9.5).round(1)
  )
end

puts "Création des listes..."
lists = ["Action", "Comédie", "Drame", "Science-fiction", "Horreur", "Aventure"]
lists.each do |list_name|
  List.create!(name: list_name)
end

puts "Création des bookmarks..."
10.times do
  Bookmark.create!(
    movie: Movie.all.sample,
    list: List.all.sample,
    comment: Faker::Quote.famous_last_words
  )
end
