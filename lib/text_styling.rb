class TextStyling
  def color_list
    %w(yellow red blue white)
  end

  def line(number, line, color, tabs)
    tab(tabs)
    number.times { print line.send(color) }
    puts
  end

  def tab(number)
    number.times { print "\t" }
  end

  def progress_bar
    bar = ProgressBar.new 10
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

  def heading_for(model)
    puts "\n"
    tab 1
    print "S/N".ljust(5, " "),
          "\t|\t", "#{model} Name".ljust(30, " "),
          "|\t", "Songs"
    puts
    line 72, "-", "white", 1
  end

  def justify(value, by = 0, by_string = " ", left = true)
    return to_string(value).ljust(by, by_string) if left
    return to_string(value).rjust(by, by_string) unless left
  end

  def to_string(value)
    value.to_s
  end

  def format(song_name, by = 0, index = 1)
    output = ""
    output << justify(index, 0, " ", false).yellow if index == 1
    output << justify(index, by, " ", false).yellow unless index == 1
    output << ".   #{song_name.green}\n"
  end

  def stat_heading
    tab 4
    put "Library Statistics", "white"
    line 74, "-", "white", 1
  end

  def result_caption(title = "")
    progress_bar
    sleep 0.5
    put "         \n\nResults: #{title}", "green"
    line 67, "-", "white", 0
  end

  def caption(text, color)
    print text.send(color)
  end

  def put(message, color = nil)
    puts message.send(color)
  end

  def available_commands_heading
    line 57, "=", "yellow", 1
    tab 3
    put "     Available Commands", "yellow"
    line 57, "=", "yellow", 1
  end

  def song_to_string(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
