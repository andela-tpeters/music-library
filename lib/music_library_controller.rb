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

  private
  def process_command(command)
    if commands[command]
      message.print_processing_text
      sleep 1.0
      send(commands[command])
    else
      message.no_command_error_message
    end
  end

  def song_to_string(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_songs
    message.progress_bar
    sleep 0.5
    message.print_result_text
    Song.all.each.with_index(1) do |song, index|
      puts "\t\t#{index}. #{song_to_string(song)}"
      puts "\t-------------------------------------------------------------".blue
    end
    puts
  end

  def list_artists
    message.progress_bar
    sleep 0.5
    message.print_result_text    
    Artist.all.each.with_index(1) do |artist, index|
      puts "\t\t#{index}. " << " #{artist.name}".yellow
    end
    puts
  end

  def list_genres
    message.progress_bar
    sleep 0.5
    message.print_result_text
    Genre.all.each.with_index(1) do |genre, index|
      puts "\t\t#{index}. " << " #{genre.name}".yellow
    end
    puts
  end

  def list_artist_songs
    message.print_artist_caption
    input = gets.chomp
    artist_found = Artist.find_by_name(input)
    check_found(artist_found,'artist')
  end

  def check_found(object_found, class_name)
    if object_found
      message.progress_bar
      sleep 0.5
      message.print_result_text
      object_found.songs.each.with_index(1) do |song, index|
        puts "\t\t#{index}." << " #{song_to_string(song)}".yellow
      end
      puts
    else
      message.put("#{class_name.capitalize} not found")
    end
  end

  def list_genre_songs
    message.print_genre_caption
    input = gets.chomp
    genre_found = Genre.find_by_name(input)
    check_found(genre_found,'genre')
  end

  def play_song
    message.print_song_number_caption
    song_number = gets.strip.to_i
    message.progress_bar
    return puts "Song number does not exist".red if song_number > Song.all.size
    sleep 0.5
    puts "\nPlaying #{song_to_string(Song.all[song_number - 1])}\n".green
    sleep 0.5
  end

  def exit
    message.exit
  end

  def commands
    message.commands
  end

  def display_commands
    message.display_commands
  end
end