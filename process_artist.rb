require 'ruby-processing'

class ProcessArtist < Processing::App

  def setup
    background(255, 255, 255)
    fill(125,0,125)
    stroke(125,0, 125)
  end

  def draw
   ellipse_mode CENTER
   rect_mode CENTER
   smooth
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

  def mouse_pressed
    color1 = rand(255)
    color2 = rand(255)
    color3 = rand(255)
    stroke(color1, color2, color3)
    fill(color1, color2, color3)
  end

  def mouse_dragged
    if @coords.nil?
      @coords = []
    end
    @coords << mouse_x
    @coords << mouse_y
  end

  def mouse_released
    @coords.each_slice(2){|x,y| ellipse x, y, 15, 15}
    @coords = nil
  end

end

ProcessArtist.new(:width => 800, :height => 800, :title => "ProcessArtist", :full_screen => false)

