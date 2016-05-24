class Artist
  attr_accessor :name
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

  def genres
    @@genres[@name]
  end

  def add_genre(genre_object)
    genres << genre_object unless genres.include?(genre_object)
    genres
  end
  


end