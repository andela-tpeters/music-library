require "music_library"

class Song < MusicLibrary

  def initialize ( name, artist = nil )
    @name = name

    self.artist = artist if !artist.nil?
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    add_song_to_artist
  end

  def add_song_to_artist
    @artist.add_song self
  end


end