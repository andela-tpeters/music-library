module Concerns
  module InstanceMethods
    def save
      unless self.class.all.include?(self)
        self.class.all << self 
      end
    end

    def add_song(song_object)
      add_artist_to_song(song_object) if self.class == Artist
      songs << song_object unless songs.include?(song_object)
      songs
    end

    def songs
      self.class.class_variable_get(:@@songs)[self.name]
    end
  end


  module ClassMethods
    def all
      self.class_variable_get(:@@all)
    end

    def destroy_all
      self.class_variable_get(:@@all).clear
    end

    def create(name)
      object = self.new(name)
      object.save
      object
    end
  end
end