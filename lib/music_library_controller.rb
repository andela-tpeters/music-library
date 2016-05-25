class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    welcome
    display_commands
    command = ""
    while command != "exit"
      print "\nEnter a Command: \n"
      command = gets.chomp
      process_command(command)
    end
  end

  def process_command(command)
    if commands[command]
      puts "\nProcessing: ".yellow
      sleep 1.0
      send(commands[command])
    else
      puts "Command not understood\n".red
    end
  end

  def display_commands
      puts 'Available Commands:'
      commands.each do |key, value|
        puts "\t" << key.green << ": " << value.to_s.gsub("_"," ").white
      end
  end

  def welcome
    bar = ProgressBar.new(10)
    puts 'Loading'
    10.times do
      sleep 0.1
      bar.increment!
    end
    system 'clear'
    puts 'Welcome Music Library'.red
  end
  

  def song_to_string(object)
    "#{object.artist.name} - #{object.name} - #{object.genre.name}"
  end

  def list_songs
    puts "\nResults: \n".green
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. " << "#{song_to_string(song)}".yellow
    end
  end

  def list_artists
    puts "\nResults: \n".green
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}." << " #{artist.name}".yellow
    end
  end

  def list_genres
    puts "\nResults: \n".green
    Genre.all.each.with_index(1) do |genre, index|
      puts "#{index}." << " #{genre.name}".yellow
    end
  end

  def list_artist_songs
    print "Enter Artist Name: ".yellow
    input = gets.chomp
    artist_found = Artist.find_by_name(input)
    if artist_found
      puts "\nResults: \n".green
      artist_found.songs.each.with_index(1) do |song, index|
        puts "#{index}." << " #{song_to_string(song)}".yellow
      end
    else
      puts "Artist not found"
    end
  end

  def list_genre_songs
    print "Enter Genre: "
    input = gets.chomp
    genre_found = Genre.find_by_name(input)
    if genre_found
      puts "\nResults: \n".green
      genre_found.songs.each.with_index(1) do |song, index|
        puts "#{index}." << " #{song_to_string(song)}".yellow
      end
    else
      puts "Genre not found"
    end
  end

  def play_song
    print "Please Choose a song number: ".yellow
    song_number = gets.strip.to_i
    puts "\n Playing:  #{song_to_string(Song.all[song_number - 1])}\n".green
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
      "help"         => :display_commands,
      "exit"         => :exit
    }
  end
end