require 'gosu'
require 'player'
require 'ball'

class MyGame < Gosu::Window
  def initialize
    super(300, 400, false)
    @player1 = Player.new(self)
    @ball = Ball.new(self)
    @pause = false
    @font = Gosu::Font.new(self, 'System', 24)
  end

  def button_down(id)
    if id == Gosu::Button::KbP
      if @pause == false
        @pause = true
      else
        @pause = false
      end
    end
  end

  def update
    if @pause == false
      if button_down? Gosu::Button::KbLeft
        @player1.move_left
      end

      if button_down? Gosu::Button::KbRight
        @player1.move_right
      end

      if button_down? Gosu::Button::KbUp
        @player1.move_up
      end

      if button_down? Gosu::Button::KbDown
        @player1.move_down
      end

      @ball.update
    end
  end

  def draw
    @player1.draw
    @ball.draw
    @font.draw("The game is paused." 50, 200, 10) if @pause == true
  end
end

class Player
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "gosu/player1.png", true)
    @x = 50
    @y = 50
  end

  def draw
    @icon.draw(@x,@y,1)
  end

  def move_left
    if @x < 0
      @x = 0
    else
      @x = @x - 10
    end
  end

  def move_right
    if @x > @game_window.width - 100)
      @x = @game_window.width - 100
    else
      @x = x + 10
    end
  end

  def move_up 
    if @y < 0
      @y = 0
    else
      @y = @y - 10
    end
  end
 
  def move_down
    if @y > (@game_window.height - 75)
      @y = @game_window.height - 75
    else
      @y = @y + 10
    end
  end
end

class Ball
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "Images/ball.png", true)
    @x = rand(@game_window.width)
    @y = 0 
  end

  def update
    @y = @y + 1
  end

  def draw
    @icon.draw(@x,@y,2)
  end

end

window = MyGame.new
window.show




