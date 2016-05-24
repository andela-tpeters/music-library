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

      song_name = filename_parts[1]
      artist_name = filename_parts[0]
      genre_name = filename_parts[2]

      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      song = Song.new(song_name,artist,genre)

      song
    end

    def create_from_filename(filename)
      filename_parts = split_filename(filename) 

      song_name = filename_parts[1]
      artist_name = filename_parts[0]
      genre_name = filename_parts[2]

      song = Song.find_or_create_by_name(song_name)
      song.artist = Artist.find_or_create_by_name(artist_name)
      song.genre = Genre.find_or_create_by_name(genre_name)
      
      song.save
      song
    end
  end
end