class TextStyling 

  def color_list
    [ "yellow","red","blue","white"]
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
    print "S/N".ljust(5," "),"\t|\t",model_name.ljust(30,' '),"|\t","Songs"
    puts
    generate_line(72,"-","white",1)
  end
end

