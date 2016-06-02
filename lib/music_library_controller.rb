class MusicLibraryController
  attr_reader :message, :output, :style

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
    @style = TextStyling.new
    @message = Messages.new
    @output = Output.new
  end

  def call
    message.welcome_message
    command = ""
    while command != "exit"
      style.put("\nEnter a Command: ", "white")
      command = gets.chomp
      process_command(command)
    end
  end

  private

  def process_command(command)
    if commands[command]
      style.put("Processing...", "yellow")
      sleep 1.0
      send(commands[command])
    else
      message.no_command_error_message
    end
  end

  def list_songs
    style.loading_bar_result_cap
    output.display_songs(Song.all)
    puts
  end

  def list_artists
    output.list_model_songs(Artist)
  end

  def list_genres
    output.list_model_songs(Genre)
  end

  def list_artist_songs
    find = get_name("Enter Artist Name: ", Artist, "yellow")
    check_found(find, "artist")
  end

  def check_found(found, name)
    if found
      style.loading_bar_result_cap
      output.display_songs(found.songs)
    else
      style.put("#{name.capitalize} not found", "red")
    end
  end

  def list_genre_songs
    find = get_name("Enter Genre: ", Genre, "yellow")
    check_found(find, "genre")
  end

  def get_song_number
    style.print_caption("Please choose song number: ", "yellow")
    gets.strip.to_i
  end

  def get_name(caption, model, color)
    style.print_caption(caption, color)
    input = gets.chomp
    model.find_by_name(input)
  end

  def play_song
    song_number = get_song_number
    style.progress_bar
    return puts "Song number does not exist".red if song_number > Song.all.size
    sleep 0.5
    puts "\nPlaying #{style.song_to_string(Song.all[song_number - 1])}\n".green
    sleep 0.5
  end

  def library_stat
    output.library_stat
  end

  def artist_library
    output.get_stat_for(Artist)
  end

  def genre_library
    output.get_stat_for(Genre)
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
