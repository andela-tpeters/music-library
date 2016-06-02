class TextStyling
  def color_list
    %w(yellow red blue white)
  end

  def generate_line(number, line, color, tabs_number)
    print_tab(tabs_number)
    number.times { print line.send(color) }
    puts
  end

  def print_tab(number)
    number.times { print "\t" }
  end

  def progress_bar
    bar = ProgressBar.new(10)
    puts "Loading"
    10.times do
      sleep 0.1
      bar.increment!
    end
    puts
  end

  def line_animate(number)
    number.times do
      sleep 0.015
      print "=".white
    end
  end

  def generate_stat_heading(model_name)
    puts "\n"
    print_tab(1)
    print("S/N".ljust(5, " "),
          "\t|\t", model_name.ljust(30, " "),
          "|\t", "Songs")
    puts
    generate_line(72, "-", "white", 1)
  end

  def justify(value, by = 0, by_string = " ", left = true)
    return to_string(value).ljust(by, by_string) if left
    return to_string(value).rjust(by, by_string) unless left
  end

  def to_string(value)
    value.to_s
  end

  def format_song_to_string(song_name, by = 0, index = 1)
    string = ""
    string << justify(index, 0, " ", false).yellow if index == 1
    string << justify(index, by, " ", false).yellow unless index == 1
    string << ".   #{song_name.green}\n"
    string
  end

  def library_stat_heading
    print_tab(4)
    puts "Library Statistics"
    generate_line(74, "-", "white", 1)
  end

  def print_result_caption
    put("         \n\nResults", "green")
    generate_line(67, "-", "white", 0)
  end

  def print_caption(string, color)
    print string.send(color)
  end

  def put(message, color)
    puts message.send(color)
  end

  def loading_bar_result_cap
    progress_bar
    sleep 0.5
    print_result_caption
  end

  def available_commands_heading
    generate_line(57, "=", "yellow", 1)
    print_tab(3)
    puts "     Available Commands".yellow
    generate_line(57, "=", "yellow", 1)
  end

  def song_to_string(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
