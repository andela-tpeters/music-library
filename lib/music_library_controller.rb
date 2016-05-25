class MusicLibraryController
  attr_reader :message
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
    @message = Messages.new
  end

  def call
    message.welcome_message
    command = ""
    while command != "exit"
      message.put("\nEnter a Command: ","white")
      command = gets.chomp
      process_command(command)
    end
  end

  def process_command(command)

    if commands[command]
      message.put('Processing: ','yellow')
      sleep 1.0
      send(commands[command])
    else
      message.put("Command not understood\n",'red')
    end
  end

  def song_to_string(object)
    "#{object.artist.name} - #{object.name} - #{object.genre.name}"
  end

  def list_songs
    message.progress_bar
    message.put("\nResults: \n",'green')
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song_to_string(song)}"
    end
  end

  def list_artists
    message.progress_bar
    message.put("\nResults: \n",'green')
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. " << " #{artist.name}".yellow
    end
  end

  def list_genres
    message.progress_bar
    message.put("\nResults: \n",'green')
    Genre.all.each.with_index(1) do |genre, index|
      puts "#{index}. " << " #{genre.name}".yellow
    end
  end

  def list_artist_songs
    print "Enter Artist Name: ".yellow
    input = gets.chomp
    artist_found = Artist.find_by_name(input)
    check_found(artist_found,'artist')
  end

  def check_found(object_found, class_name)
    if object_found
      message.progress_bar
      message.put("\nResults: \n",'green')
      object_found.songs.each.with_index(1) do |song, index|
        puts "#{index}." << " #{song_to_string(song)}".yellow
      end
    else
      puts "#{class_name.capitalize} not found"
    end
  end

  def list_genre_songs
    print "Enter Genre: "
    input = gets.chomp
    genre_found = Genre.find_by_name(input)
    check_found(genre_found,'genre')
  end

  def play_song
    print "Please Choose a song number: ".yellow
    song_number = gets.strip.to_i
    message.progress_bar
    puts "\nPlaying #{song_to_string(Song.all[song_number - 1])} \n".green
  end

  def exit
    message.exit
  end

  def commands
    message.commands
  end
end