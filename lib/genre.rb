class Genre
  attr_accessor :name
  include Concerns
  @@songs = {}
  @@artists = {}
  @@all = []

  def initialize(name)
    @name = name
    @@songs[name] = []
    @@artists[name] = []
  end

  def artists
    @@artists[@name]
  end

  def add_artist(artist)
    artists << artist unless artists.include?(artist)
    artists
  end
end
