require 'ruby-processing'

class ProcessArtist < Processing::App

  def setup
    background(0, 0, 0)
  end

  def draw
    # Do Stuff
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
      @queue = ""
    end
  end

end

ProcessArtist.new(:width => 800, :height => 800, :title => "ProcessArtist", :full_screen => false)

