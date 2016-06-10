class Song
  attr_accessor :name
  attr_reader :artist, :genre
  include Concerns
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def artist=(artist)
    @artist = artist
    add_song_to_artist
  end

  def genre=(genre)
    @genre = genre
    add_song_to_genre
    add_genre_to_artist if @artist
    add_artist_to_genre
  end

  def add_song_to_artist
    artist.add_song self
  end

  def add_song_to_genre
    genre.add_song self
  end

  def add_genre_to_artist
    artist.add_genre genre
  end

  def add_artist_to_genre
    genre.add_artist artist
  end

  def self.filename_parts(filename)
    filename[0..-5].split(" - ")
  end

  def self.new_from_filename(filename)
    splited = self.filename_parts(filename)
    song_name = splited[1]
    artist_name = splited[0]
    genre_name = splited[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end
end
