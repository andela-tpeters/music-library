<<<<<<< HEAD
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

=======
<<<<<<< HEAD
require "music_library"

class Song < MusicLibrary
  attr_reader :artist
  attr_accessor :name

  def initialize ( name, artist = nil, genre = nil)
    @name = name

    add_song_to_artist(artist) if !artist.nil?

    add_song_to_genre(genre) if !genre.nil?

    add_artist_to_genre(artist) if !artist.nil? && !genre.nil?
  end

  def genre
    @genre
  end

  def genres
    @@genres
  end

  def artist=(artist)
    @artist = artist
    add_song_to_artist(artist) if !artist.nil?
  end

  def add_song_to_artist(artist)
    @artist = artist
    @artist.send(:add_song,self)
  end

  def genre=(genre)
    @genre = genre
    add_song_to_genre(genre) if !genre.nil?
  end

  def add_song_to_genre(genre)
    @genre = genre
    @artist.add_genre(genre) if !@artist.nil?
    @genre.add_song(self) if !genre.nil?
  end

  def add_genre_to_artist(genre)
    @artist.add_genre(genre)
  end

  def add_artist_to_genre(artist)
    @genre.add_artist(artist)
=======
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

>>>>>>> origin/master
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
<<<<<<< HEAD
  end

  def add_song_to_genre
    genre.add_song(self)
  end

  def add_to_artist_genre
    artist.add_genre(genre)
  end

=======
  end

  def add_song_to_genre
    genre.add_song(self)
>>>>>>> master
  end

  def add_to_artist_genre
    artist.add_genre(genre)
  end

>>>>>>> origin/master
  def add_to_genre_artist
    genre.add_artist(artist)
  end
end