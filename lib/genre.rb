class Genre
  
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable
  attr_accessor :name
  
  @@all = []
  @@songs = {}
  @@artists = {}

  def initialize(name)
    @name = name
    @@songs[name] = []
    @@artists[name] = []
  end

  def add_song(song_object)
    songs << song_object unless songs.include?(song_object)
    songs
  end

end