require "music_library"

class Genre < MusicLibrary
  attr_reader :songs

  def initialize(name)
    super

    @songs = []
    @@artists = []
    @@artists_ids = []
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
  end

  def artists
    @@artists
  end

  def add_artist(artist)
    if !@@artists_ids.include?(artist.name)
      @@artists_ids << artist.name
      @@artists << artist if !@@artists.include?(artist)
    end
  end
end