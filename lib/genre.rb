class Genre
  
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :artists
  
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artists = []
  end

  def add_song(song_object)
    songs << song_object unless songs.include?(song_object)
    songs
  end

end