require_relative("../db/sql_runner")
require_relative("./star")
class Movie

  attr_reader :id
  attr_accessor :title, :genre, :rating

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @rating = options['rating'].to_i
  end

  def save()
    sql = "INSERT INTO movies
    ( title, genre, rating )
    VALUES
    ( $1, $2, $3 )
    RETURNING id"
    values = [@title, @genre, @rating]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM movies"
    values = []
    movies = SqlRunner.run(sql, values)
    result = movies.map { |movie| Movie.new( movie )}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def all_stars()
    sql = "SELECT stars.*
            FROM stars
            INNER JOIN castings
            ON castings.star_id = stars.id
            WHERE movie_id = $1"
    values = [@id]
    stars = SqlRunner.run( sql, values )
    result = stars.map { |star| Star.new( star ) }
    return result
  end
end
