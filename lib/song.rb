class Song
  attr_reader :artist, :genre
  
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name, artist_object= nil, genre_object = nil)
    @name = name
    self.artist=(artist_object) if !artist_object.nil?
    self.genre=(genre_object) if !genre_object.nil?
  end

  def artist=(artist_object)
    @artist = artist_object
    add_song_to_artist
  end

  def genre=(genre_object)
    @genre = genre_object
    add_song_to_genre
    add_to_artist_genre if @artist
    add_to_genre_artist
  end

  def add_song_to_artist
    artist.add_song(self)
  end

  def add_song_to_genre
    genre.add_song(self)
  end

  def add_to_artist_genre
    artist.add_genre(genre)
  end

  def add_to_genre_artist
    genre.add_artist(artist)
  end
end