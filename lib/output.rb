class Output
  attr_reader :style

  def initialize
    @style = TextStyling.new
  end

  def data_hash
    {
      "Songs" => Song.all.size,
      "Artists" => Artist.all.size,
      "Genres" => Genre.all.size
    }
  end

  def display_songs(songs)
    songs.each.with_index(1) do |song, index|
      puts "\t\t#{index}. #{style.song_to_string(song)}"
      style.generate_line(61, "-", "blue", 1)
    end
  end

  def list_model_songs(model)
    style.loading_bar_result_cap
    model.all.each.with_index(1) do |object, index|
      puts "\t\t#{index}. " << " #{object.name}".yellow
    end
    puts
  end

  def library_stat
    style.library_stat_heading
    index = 0
    data_hash.each do |model, value|
      style.print_tab(2)
      summary_text(model, value, style.color_list[index])
      index += 1
    end
  end

  def summary_text(model, value, color)
    print "Total #{model}  in Library".ljust(25, " ").send(color),
          "\t|\t",
          value.to_s.send(color),
          "\n"
  end

  def get_stat_for(model)
    style.generate_stat_heading("#{model} Name")
    model_songs = model.class_variable_get(:@@songs)
    model_songs.each.with_index(1) do |pair, index|
      pair_to_string(pair[0], pair[1], index)
      style.generate_stat_heading("#{model} Name") if index % 25 == 0
    end
  end

  def pair_to_string(name, songs, index)
    songs_string = songs_to_string(songs)
    justified_index = style.justify(index, 5, " ", true)
    justified_name = style.justify(name, 30, " ", true).red
    style.print_tab(1)
    print "\t #{justified_index}\t#{justified_name}\t   #{songs_string}\n"
    style.generate_line(73, "-", "blue", 1)
  end

  def songs_to_string(songs)
    songs_string = ""
    songs.each.with_index(1) do |song, index|
      songs_string << style.format_song_to_string(song.name, 60, index)
    end
    songs_string
  end
end
