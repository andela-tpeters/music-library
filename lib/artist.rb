class Artist
  attr_accessor :name
  include Concerns
  @@songs = {}
  @@genres = {}
  @all = @@all = []

  def initialize(name)
    @name = name
    @@songs[name] = []
    @@genres[name] = []
  end

  def add_artist_to_song(song)
    song.artist = self if song.artist.nil?
  end

  def genres
    @@genres[@name]
  end

  def add_genre(genre)
    genres << genre unless genres.include?(genre)
    genres
  end
end
