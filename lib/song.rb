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
  end


end