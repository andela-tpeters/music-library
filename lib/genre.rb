class Genre
  
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable
  attr_accessor :name
  
  @@all = []
  @@songs = {}
  @@artists = {}

  def initialize(name)
<<<<<<< HEAD
    super

    @songs = []
    @@artists = []
    @@artists_ids = []
=======
    @name = name
    @@songs[name] = []
    @@artists[name] = []
>>>>>>> master
  end

  def add_song(song_object)
    songs << song_object unless songs.include?(song_object)
    songs
  end

<<<<<<< HEAD
  def artists
    @@artists
  end

  def add_artist(artist)
    if !@@artists_ids.include?(artist.name)
      @@artists_ids << artist.name
      @@artists << artist if !@@artists.include?(artist)
    end
  end
=======
>>>>>>> master
end