class Messages
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

  def put(message,color)
    puts message.send(color)
  end

  def available_commands
    puts """
      =========================================================
                          Available Commands
      =========================================================""".yellow
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
      puts "\tCommands\t| Description"
      puts "\t--------------------------------"
      commands.each do |key, value|
      	if key == 'help' || key == 'exit'
      		puts "\t" << key.green << "\t\t| " << value.to_s.gsub("_"," ").white
      		next
      	end
        puts "\t" << key.green << "\t| " << value.to_s.gsub("_"," ").white
      end
  end

  def welcome_message
    progress_bar
    system 'clear'
    puts """
    =============================================================
                        Welcome Music Library
    =============================================================""".white
    display_commands
  end

  def print_result_text
    put("\nResults",'green')
    put("__________________________________________________________",'white')
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
  
  
end