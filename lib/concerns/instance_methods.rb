module Concerns
  module InstanceMethods
    def save
      unless self.class.all.include?(self)
        self.class.all << self
      end
      self
    end

    def add_song(song)
      add_artist_to_song(song) if self.class == Artist
      songs << song unless songs.include?(song)
    end

    def songs
      self.class.class_variable_get(:@@songs)[name]
    end
  end
end
