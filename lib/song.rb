require "music_library"

class Song < MusicLibrary
  attr_reader :artist, :genre

  def initialize ( name, artist = nil, genre = nil )
    @name = name

    self.artist = artist if !artist.nil?
    self.genre = genre if !genre.nil?
  end

  def artist=(artist)
    @artist = artist
    add_song_to_artist
  end

  def add_song_to_artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    add_song_to_genre
  end

  def add_song_to_genre
    @genre.add_song(self)
  end


end