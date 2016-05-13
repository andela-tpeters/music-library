require "music_library"

class Genre < MusicLibrary
  attr_reader :songs

  def initialize(name)
    super

    @songs = []
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
  end
end