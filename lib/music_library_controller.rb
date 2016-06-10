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
      run command
    end
  end

  private

  def run(command)
    if commands[command]
      style.put("Processing...", "yellow")
      sleep 1.0
      send(commands[command])
    else
      message.no_command_error_message
    end
  end

  def list_songs
    style.result_caption "All Songs"
    output.songs Song.all
    puts
  end

  def list_artists
    output.all Artist
  end

  def list_genres
    output.all Genre
  end

  def get_name(caption, model, color)
    style.caption caption, color
    input = gets.chomp
    model.find_by_name(input)
  end

  def artist_songs
    artist = get_name("Enter Artist Name: ", Artist, "yellow")
    display_songs artist, "artist"
  end

  def genre_songs
    genre = get_name("Enter Genre: ", Genre, "yellow")
    display_songs genre, "genre"
  end

  def display_songs(item, title)
    if item
      style.result_caption "songs of #{item.name}"
      output.songs item.songs
    else
      style.put("#{title.capitalize} not found", "red")
    end
  end

  def song_number
    style.caption("Please choose song number: ", "yellow")
    gets.strip.to_i
  end

  def play_song
    number = song_number
    style.progress_bar
    return puts "Song does not exist".red if check_number(number).nil?
    sleep 0.5
    output = style.song_to_string(Song.all[number - 1])
    puts "\nPlaying #{output}\n".green
  end

  def check_number(number)
    if number >= 1 && number <= Song.all.size
      number
    end
  end

  def library_statistics
    output.library_statistics
  end

  def all_artists_songs
    output.songs_for_all Artist
  end

  def all_genres_songs
    output.songs_for_all Genre
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
