class Game
  def initialize(name)
    @name = name
    @player_1 = Player.new('Player 1')
    @player_2 = Player.new('Player 2')
    @new_question = Question.new
  end

  def new
    puts "New Game!"
    round
  end

  def round
    turn(@player_1)
    show_score
    turn(@player_2)
    show_score
  end

  def turn (player)
    @new_question.ask_question(player.name)
    input = gets.chomp
    if @new_question.correct(input)
      puts 'Correct!'
    else
      puts 'NOPE'
      lose_life(player)
    end
  end

  def lose_life(player)
    player.lives -= 1
  end

  def show_score
    puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
  end

end