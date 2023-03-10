require './player'

class Question

  def initialize
    @num1 = rand(1..9)
    @num2 = rand(1..9)
    @total = @num1 + @num2
  end

  def ask_question(player)
    print "#{player}: What does #{@num1} plus #{@num2} equal?  > "
  end

  def correct(answer)
    @total === answer.to_i
  end
    
end