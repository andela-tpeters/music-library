class Output
  attr_reader :style

  def initialize
    @style = TextStyling.new
  end

  def lib_summary
    {
      "Songs" => Song.all.size,
      "Artists" => Artist.all.size,
      "Genres" => Genre.all.size
    }
  end

  def songs(songs)
    songs.each.with_index(1) do |song, index|
      puts "\t\t#{index}. #{style.song_to_string(song)}"
      style.line 61, "-", "blue", 1
    end
  end

  def all(model)
    style.result_caption "All #{model}s"
    model.all.each.with_index(1) do |item, index|
      puts "\t\t#{index}. " << " #{item.name}".yellow
    end
    puts
  end

  def library_statistics
    style.stat_heading
    lib_summary.each.with_index do |item, index|
      style.tab 2
      summary(item[0], item[1], style.color_list[index])
    end
  end

  def summary(model, value, color)
    print "Total #{model}  in Library".ljust(25, ' ').send(color),
          "\t|\t #{value.to_s.send(color)} \n"
  end

  def songs_for_all(model)
    style.heading_for model
    songs = model.class_variable_get(:@@songs)
    songs.each.with_index(1) do |item, index|
      stringify item[0], item[1], index
      style.heading_for model if index % 25 == 0
    end
  end

  def stringify(name, songs, index)
    output = songs_to_string songs
    index = style.justify index, 5, " ", true
    name = style.justify(name, 30, " ", true).red
    style.tab 1
    print " #{index}\t\t#{name}\t   #{output}\n"
    style.line 73, "-", "blue", 1
  end

  def songs_to_string(songs)
    output = ""
    songs.each.with_index(1) do |song, index|
      output << style.format(song.name, 60, index)
    end
    output
  end
end
