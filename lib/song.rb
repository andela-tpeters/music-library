require "music_library"

class Song < MusicLibrary
  attr_accessor :artist

  def artist
    @artist
  end

  def artist= artist
    @artist = artist
    add_song_to_artist
  end

  def add_song_to_artist
    @artist.songs << self
  end


end