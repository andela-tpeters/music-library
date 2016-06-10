class Messages < TextStyling
  attr_reader :style

  def initialize
    @style = TextStyling.new
  end

  def exit
    puts "Goodbye"
  end

  def commands
    {
      "lib stat"            => :library_statistics,
      "lib artists"         => :all_artists_songs,
      "lib genres"          => :all_genres_songs,
      "list songs"          => :list_songs,
      "list artists"        => :list_artists,
      "list artist"         => :artist_songs,
      "list genres"         => :list_genres,
      "list genre"          => :genre_songs,
      "play song"           => :play_song,
      "help"                => :display_commands,
      "exit"                => :exit
    }
  end

  def commands_description
    {
      "lib stat"            => "Displays Library Statistics",
      "lib artists"         => "Displays Artists Library Statistics",
      "lib genres"          => "Displays Genre Library Statistics",
      "list songs"          => "Lists all the songs in the Dir",
      "list artists"        => "Lists all Artists for songs in the Dir",
      "list artist"         => "Lists the songs for an Artist",
      "list genres"         => "Lists all the Genres for songs in the Dir",
      "list genre"          => "Lists songs in a Genre",
      "play song"           => "Plays a chosen song",
      "help"                => "Displays all available commands",
      "exit"                => "Exits the application"
    }
  end

  def display_commands
    style.available_commands_heading
    print "\t\tCommands ", "\t\t|\t", "Description\n"
    style.line(60, "-", "white", 1)
    commands_description.each do |key, value|
      puts "\t\t#{key.ljust(20, ' ').green}\t|\t#{value.white}"
    end
  end

  def welcome_message
    style.progress_bar
    system "clear"
    style.line_animate(80)
    puts
    style.tab(3)
    puts "   Welcome to Music Library".white
    display_commands
  end

  def no_command_error_message
    style.put("Error:\n
      The command action is not available:
      Please check the spellings and try again
      or run 'help' to see list of available commands", "red")
  end
end
