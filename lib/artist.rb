class Artist
  attr_accessor :name
  attr_reader :songs, :genres
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
  end

  def add_artist_to_song(song_object)
    song_object.artist = self if song_object.artist.nil?
  end

  def add_song(song_object)
    add_artist_to_song(song_object) if self.class == Artist
    songs << song_object unless songs.include?(song_object)
    songs
  end


end