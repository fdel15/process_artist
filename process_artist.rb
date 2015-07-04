require 'ruby-processing'

class ProcessArtist < Processing::App

  def setup
    background(0, 0, 0)
  end

  def draw
    # Do Stuff
  end

  def run_command(command)
    if command[0] == 'b'
      set_background_color(command[1..-1])
    else
      warn "Sorry I do not recognize that command. Please try again"
    end
  end

  def set_background_color(string)
    colors = string.split(",").map{|num| num.to_i}
    background(colors[0], colors[1], colors[2])
  end

  def key_pressed
    warn "A key was pressed! #{key.inspect}"
    if @queue.nil?
      @queue = ""
    end

    if key != "\n"
      @queue = @queue + key
    else
      warn "Time to run the command : #{@queue}"
      run_command(@queue)
      @queue = ""
    end
  end

end

ProcessArtist.new(:width => 800, :height => 800, :title => "ProcessArtist", :full_screen => false)

