require('pg')
require_relative('../db/sqlrunner')
require_relative('artist')
require('pry')


class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(album)
    @id = album['id'].to_i if album['id']
    @title = album['title']
    @genre = album['genre']
    @artist_id = album['artist_id'].to_i
  end

  def artist
    sql = "SELECT FROM artists WHERE id = $1"
    values = [@artist_id]
    result = Sqlrunner.run(sql, values)
    artist_data = result[0]
    return  Artist.new(artist_data)
  end

  def self.find(id)
    sql = "SELECT FROM artists WHERE id = $1"
    value = [id]
    result = Sqlrunner.run(sql, values)
    album_data = result[0]
    return  Album.new(album_data)
  end

  def save
    sql = "INSERT INTO albums (title, genre) VALUES ($1, $2, $3) RETURNING *"
    values = [@title, @genre, @artist_id]
    result = Sqlrunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM albums'
    Sqlrunner.run(sql)
  end

  def self_all
    sql = "SELECT * FROM album"
    albums = Sqlrunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end

  def update()
    sql = "UPDATE  albums SET (
    'title',
    'genre',
    'artist_id'
     ) = (
    $1, $2, $3)
    WHERE id = $4"
    values = [@title, @genre, @artist_id]
    Sqlrunner.run(sql, values)
  end

  def self.delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    Sqlrunner.run(sql, values)
  end

end
