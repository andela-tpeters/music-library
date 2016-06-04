module Concerns
  module ClassMethods
    def all
      @all
    end

    def destroy_all
      all.clear
    end

    def create(name)
      song = new(name)
      song.save
      song
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
      Song.new(song_name, artist, genre)
    end

    def create_from_filename(filename)
      song = new_from_filename(filename)
      song.save
      song
    end
  end
end
