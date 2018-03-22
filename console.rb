require('pry')
require_relative('models/casting')
require_relative('models/star')
require_relative('models/movie')

star1 = Star.new({ 'first_name' => 'Brad', 'last_name' => 'Pitt' })
star2 = Star.new({ 'first_name' => 'George', 'last_name' => 'Clooney' })
star3 = Star.new({ 'first_name' => 'Julia', 'last_name' => 'Roberts' })
star1.save()
star2.save()
star3.save()

movie1 = Movie.new({ 'title' => 'Oceans Eleven', 'genre' => 'Action', 'rating' => '9'})
movie2 = Movie.new({ 'title' => 'Confessions of a dangerous mind', 'genre' => 'Drama', 'rating' => '6'})
movie3 = Movie.new({ 'title' => 'The Mexican', 'genre' => 'Adventure', 'rating' => '8'})
movie1.save()
movie2.save()
movie3.save()

casting1 = Casting.new({ 'star_id' => star1.id, 'movie_id' => movie1.id, 'fee' => '200000'})
casting2 = Casting.new({ 'star_id' => star1.id, 'movie_id' => movie2.id, 'fee' => '100000'})
casting3 = Casting.new({ 'star_id' => star1.id, 'movie_id' => movie3.id, 'fee' => '70000'})
casting4 = Casting.new({ 'star_id' => star2.id, 'movie_id' => movie1.id, 'fee' => '200000'})
casting5 = Casting.new({ 'star_id' => star2.id, 'movie_id' => movie2.id, 'fee' => '80000'})
casting6 = Casting.new({ 'star_id' => star3.id, 'movie_id' => movie1.id, 'fee' => '50000'})
casting7 = Casting.new({ 'star_id' => star3.id, 'movie_id' => movie2.id, 'fee' => '50000'})
casting8 = Casting.new({ 'star_id' => star3.id, 'movie_id' => movie3.id, 'fee' => '40000'})

casting1.save()
casting2.save()
casting3.save()
casting4.save()
casting5.save()
casting6.save()
casting7.save()
casting8.save()

p star1.all_movies

puts ""

p movie3.all_stars
