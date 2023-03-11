class Game
  def initialize(name)
    @name = name
    @player_1 = Player.new('Player 1')
    @player_2 = Player.new('Player 2')
  end

  def new
    puts "New Game!"
    round
  end

  def round
    turn(@player_1)
    show_score
    puts "----- NEW TURN -----"
    turn(@player_2)
    show_score
    puts "----- NEW TURN -----"
    round
  end

  def turn (player)
    @new_question = Question.new
    @new_question.ask_question(player.name)
    input = gets.chomp
    if @new_question.correct(input)
      puts 'YES! You are correct.'
    else
      puts 'Seriously? No!'
      lose_life(player)
    end
  end

  def lose_life(player)
    player.lives -= 1
  end

  def is_dead(player)
    if player.lives == 0
      return true
    end
  end

  def show_score
    unless is_dead(@player_1) || is_dead(@player_2)
      puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
    else
      declare_winner
    end
  end

  def declare_winner
    if is_dead(@player_1)
      puts "Player 2 wins with a score of #{@player_2.lives}/3!"
    else
      puts "Player 1 wins with a score of #{@player_2.lives}/3!"
    end
    puts "----- GAME OVER -----"
    puts "Good bye!"
    exit!
  end

end