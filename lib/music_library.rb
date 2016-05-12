class MusicLibrary
  attr_accessor :name
  @@all = []

  def initialize name
    @name = name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create name
    @@all << self.new(name).save
  end
end