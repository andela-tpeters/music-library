class Messages
  def exit
    puts "Goodbye"
  end

  def commands
    {
      "lib stat"            => :library_stat,
      "lib stat artists"    => :artist_library,
      "lib stat genres"     => :genre_library,
      "list songs"          => :list_songs,
      "list artists"        => :list_artists,
      "list artist"         => :list_artist_songs,
      "list genres"         => :list_genres,
      "list genre"          => :list_genre_songs,
      "play song"           => :play_song,
      "help"                => :display_commands,
      "exit"                => :exit
    }
  end

  def commands_and_description
    {
      "lib stat"            => "Displays Library Statistics",
      "lib stat artists"    => "Displays Artists Library Statistics",
      "lib stat genres"     => "Displays Genre Library Statistics",
      "list songs"          => "Lists all the songs in the Directory",
      "list artists"        => "Lists all Artists for songs in the Directory",
      "list artist"         => "Lists the songs for an Artist",
      "list genres"         => "Lists all the Genres for songs in the Directory",
      "list genre"          => "Lists songs in a Genre",
      "play song"           => "Plays a chosen song",
      "help"                => "Displays all available commands",
      "exit"                => "Exits the application"
    }
  end

  def put(message,color)
    puts message.send(color)
  end

  def available_commands
    generate_line(57,"=","yellow",1)
    print_tab(3)
    puts "     Available Commands".yellow
    generate_line(57,"=","yellow",1)
  end

  def generate_line(number,line,color,tabs_number)
    print_tab(tabs_number)
    number.times { print line.send(color) }
    puts
  end

  def print_tab(number)
    number.times { print "\t"}
  end

  def progress_bar
    bar = ProgressBar.new(10)
    puts 'Loading'
    10.times do
      sleep 0.1
      bar.increment!
    end
    puts
  end

  def display_commands
      available_commands
      print "\t\tCommands ", "\t\t|\t", "Description\n"
      generate_line(60,"-",'white',1)
      commands_and_description.each do |key, value|
        puts "\t\t#{key.ljust(20,' ').green}\t|\t#{value.white}"
      end
  end

  def welcome_message
    progress_bar
    system 'clear'
    80.times do 
      sleep 0.015
      print '='.white
    end
    puts
    print_tab(3)
    puts "   Welcome Music Library".white
    display_commands
  end

  def print_result_text
    put("         \n\nResults",'green')
    generate_line(67,"-","white",0)
  end

  def print_processing_text
    put('Processing: ','yellow')
  end

  def print_artist_caption
    print "Enter Artist Name: ".yellow
  end

  def print_genre_caption
    print "Enter Genre: ".yellow
  end

  def print_song_number_caption
    print "Please Choose a song number: ".yellow
  end

  def no_command_error_message
  	put("""Error:
  		The command action is not available: 
  		Please check the spellings and try again
  		or run #{"\"help\"".white} to see list of available commands

  	""",'red')
  end

  def library_stat
    total_songs = Song.all.size
    total_artists = Artist.all.size
    total_genre = Genre.all.size
    puts "\n"
    print_tab(4)
    puts "Library Statistics"
    generate_line(74,'-','white',1)
    print_tab(2)
    summary_text("Songs",total_songs,'red')
    print_tab(2)
    summary_text("Artists",total_artists,'white')
    print_tab(2)
    summary_text("Genres",total_genre,'yellow')
  end

  def summary_text(model,value,color)
    print "Total #{model}  in Library".ljust(25," ").send(color), "\t|\t", value.to_s.send(color),"\n"
  end

  def generate_stat_heading(model_name)
    puts "\n"
    print_tab(1)
    print "S/N".ljust(5," "),"\t|\t",model_name.ljust(30,' '),"|\t","Songs"
    puts
    generate_line(72,"-","white",1)
  end

  def genre_library
    generate_stat_heading("Genre Name")
    Genre.class_variable_get(:@@songs).each.with_index(1) do |pair,index|
      pair_to_string(pair[0],pair[1],index)
      generate_stat_heading("Genre Name") if index % 25 == 0
    end
  end

  def artist_library
     generate_stat_heading("Artist Name")
    Artist.class_variable_get(:@@songs).each.with_index(1) do |pair,index|
      pair_to_string(pair[0],pair[1],index)
      generate_stat_heading("Artist Name") if index % 25 == 0
    end
  end

  def pair_to_string(name,songs,index)
    songs_string = songs_to_string(songs)
    print_tab(1)
    puts "   #{index.to_s.ljust(5, ' ')}\t#{name.ljust(30,' ').red}\t  #{songs_string}"
    generate_line(73,'-','blue',1)
  end

  def songs_to_string(songs)
    songs_string = ""
    songs.each.with_index(1) do |song,index| 
      songs_string << "#{index.to_s.yellow}. #{song.name.green}\n" if index == 1
      next if index == 1
      songs_string << "#{index.to_s.rjust(60," ").yellow}. #{song.name.green}\n"""
    end
    songs_string
  end
  
  
end