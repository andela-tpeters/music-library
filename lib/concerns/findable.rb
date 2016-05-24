module Concerns
  module Findable

    def find_by_name(name)
      found = self.class_variable_get(:@@all).find_all { |object| 
                    object.name == name
                }
      
      return found if found.size > 1
      return found[0] if found.size == 1
      return nil if found.size == 0
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end

    def split_filename(filename)
      filename[0..-5].split(" - ")
    end

    def new_from_filename(filename)
      filename_parts = split_filename(filename) 

      name = filename_parts[1]

      artist = Artist.find_or_create_by_name(filename_parts[0])
      genre = Genre.find_or_create_by_name(filename_parts[2])
      song = Song.new(name,artist,genre)

      song
    end

    def create_from_filename(filename)
      splitted = split_filename(filename)
      song = Song.find_or_create_by_name(splitted[1])
      song.artist = Artist.find_or_create_by_name(splitted[0])
      song.genre = Genre.find_or_create_by_name(splitted[2])
      song.save
      song
    end
  end
end