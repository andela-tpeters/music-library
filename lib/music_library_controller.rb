
class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    command = ""
    while command != "exit"
      command = gets.chomp
      if commands[command]
        send(commands[command])
      else
        puts "Command not understood"
      end
    end
  end
  

  def song_to_string(object)
    "#{object.artist.name} - #{object.name} - #{object.genre.name}"
  end

  ['songs','artists','genres'].each do |class_name|

    this_class = eval(class_name.capitalize[0..-2])

    define_method("list_#{class_name}") do
      this_class.all.each.with_index(1) do |object, index|
        text = ""
        if this_class == Song
          text = song_to_string(object)
        else
          text = object.name
        end
        puts "#{index}. #{text}"
      end
    end
  end

  ['artist','genre'].each do |class_name|
    this_class = eval(class_name.capitalize)

    define_method("list_#{class_name}") do
      puts "Enter #{class_name.capitalize}: "
      input = gets.strip

      found_object = this_class.find_by_name(input)
      if found_object
        found_object.songs.each.with_index(1) do |song, index|
          puts "#{index}. #{song_to_string(song)}"
        end
      else
        puts "#{class_name.capitalize} not found"
      end
    end
  end

  def play_song
    puts "Please Choose a song number"
    song_number = gets.strip.to_i
    puts "Playing #{song_to_string(Song.all[song_number - 1]) }"
  end

  def exit
    puts "Goodbye"
  end

  def commands
    {
      "list songs"   => :list_songs,
      "list artists" => :list_artists,
      "list artist"  => :list_artist,
      "list genres"  => :list_genres,
      "list genre"   => :list_genre,
      "play song"    => :play_song,
      "exit"         => :exit
    }
  end
end