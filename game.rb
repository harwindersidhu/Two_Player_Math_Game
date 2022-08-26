require "./player"

class Game
  attr_accessor :curr_player, :player_one, :player_two

  def initialize
    self.player_one = Player.new("1")
    self.player_two = Player.new("2")
    self.curr_player = player_one
  end

  def question
    number1 = rand(21)
    number2 = rand(21)
    sum = number1 + number2
    puts "Player #{curr_player.player_name}: What does #{number1} plus #{number2} equal?"
    answer = gets.chomp.to_i
    if answer == sum
      puts "Player #{curr_player.player_name}: YES! You are correct."
    else
      puts "Player #{curr_player.player_name}: Seriously? No!"
      curr_player.player_life -= 1
    end
  end

  def game_over
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def start_game
    self.question
    puts "P1: #{player_one.player_life}/3 vs P2: #{player_two.player_life}/3"
    if player_one.player_life == 0
      puts "Player 2 wins with a score of #{player_two.player_life}/3"
      self.game_over
    elsif player_two.player_life == 0
      puts "Player 1 wins with a score of #{player_one.player_life}/3"
      self.game_over
    else 
      puts "----- NEW TURN -----"
      if curr_player == player_one
        self.curr_player = player_two
      else
        self.curr_player = player_one
      end
      self.start_game
    end
    
  end
end