class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end
  def errors_made
    return errors.length
  end

  def errors_allowed
   TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    result =
      @letters.map do |letter|
      if @user_guesses.include?(letter)
        letter
      else
        nil
      end
      end
    return result
  end

  def errors
    return @user_guesses - @letters
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    if !over? && !@user_guesses.include?(letter)
        @user_guesses << letter
     end
  end
  
  def word
    return letters.join
  end

  def won?
    return (@letters - @user_guesses).empty?
  end

  def lost?
   return errors_allowed == 0
  end

end
