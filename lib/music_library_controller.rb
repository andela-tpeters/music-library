
class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Available Commands"

    puts commands.to_a.join(" => ")

    command = ""
    while command != "exit"
      command = gets.chomp
      if commands[command]
        send(commands[command])
      else
        puts "Command not understood"
      end
    end
  end
  

  def song_to_string(object)
    "#{object.artist.name} - #{object.name} - #{object.genre.name}"
  end

  def list_songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song_to_string(song)}"
    end
  end

  def list_artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_artist_songs
    puts "Enter Artist Name: "
    input = gets.chomp

    artist_found = Artist.find_by_name(input)

    if artist_found
      artist_found.songs.each.with_index(1) do |song, index|
        puts "#{index}. #{song_to_string(song)}"
      end
    else
      puts "Artist not found"
    end
  end

  def list_genre_songs
    puts "Enter Genre: "
    input = gets.chomp

    genre_found = Genre.find_by_name(input)

    if genre_found
      genre_found.songs.each.with_index(1) do |song, index|
        puts "#{index}. #{song_to_string(song)}"
      end
    else
      puts "Genre not found"
    end
  end

  def play_song
    puts "Please Choose a song number"
    song_number = gets.strip.to_i
    puts "Playing #{song_to_string(Song.all[song_number - 1]) }"
  end

  def exit
    puts "Goodbye"
  end

  def commands
    {
      "list songs"   => :list_songs,
      "list artists" => :list_artists,
      "list artist"  => :list_artist_songs,
      "list genres"  => :list_genres,
      "list genre"   => :list_genre_songs,
      "play song"    => :play_song,
      "exit"         => :exit
    }
  end
end