class Genre
  attr_accessor :name
  include Concerns
  @@songs = {}
  @@artists = {}

  def initialize(name)
    @name = name
    @@songs[name] = []
    @@artists[name] = []
  end

  def artists
    @@artists[@name]
  end

  def add_artist(artist_object)
    artists << artist_object unless artists.include?(artist_object)
    artists
  end

  def self.all
    @@all ||= []
  end
end
