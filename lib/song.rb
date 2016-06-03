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
