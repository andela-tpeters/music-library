require "music_library"

class Artist < MusicLibrary
  attr_reader :songs

  def initialize(name)
    super
    @songs = []
    @@genres = []
    @@genre_ids = []
  end

  def add_song(song)
    add_artist_to_song(song) if song.artist.nil?
    @songs << song if !@songs.include?(song)
  end

  def add_artist_to_song(song)
    song.artist = self
  end

  def genres
    @@genres
  end

  def add_genre(genre)
    if !@@genre_ids.include?(genre.name)
      @@genre_ids << genre.name
      @@genres << genre if !@@genres.include?(genre)
    end

    # binding.pry
  end


end