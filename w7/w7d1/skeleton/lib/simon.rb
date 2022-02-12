class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(game_over = false, seq = [])
    @sequence_length = 1
    @seq = seq
    @game_over = game_over
  end

  def play
    until game_over == true
      take_turn
    end 
    
    if game_over == true
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence
    require_sequence
     if game_over == false
      self.round_success_message
      @sequence_length += 1
     end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game
    # self.seq.length = 1
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end
