class Artist
  attr_accessor :name

<<<<<<< HEAD
class Artist < MusicLibrary
  attr_reader :songs

  def initialize(name)
    super
    @songs = []
    @@genres = []
    @@genre_ids = []
  end

  def add_song(song)
    add_artist_to_song(song) if song.artist.nil?
    @songs << song if !@songs.include?(song)
  end

  def add_artist_to_song(song)
    song.artist = self
  end

  def genres
    @@genres
  end

  def add_genre(genre)
    if !@@genre_ids.include?(genre.name)
      @@genre_ids << genre.name
      @@genres << genre if !@@genres.include?(genre)
    end

    # binding.pry
=======
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  @@all = []
  @@songs = {}
  @@genres = {}
  
  def initialize(name)
    @name = name
    @@songs[name] = []
    @@genres[name] = []
  end

  def add_artist_to_song(song_object)
    song_object.artist = self if song_object.artist.nil?
  end

  def add_song(song_object)
    add_artist_to_song(song_object) if self.class == Artist
    songs << song_object unless songs.include?(song_object)
    songs
>>>>>>> master
  end


end