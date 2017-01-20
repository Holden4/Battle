class Game

  attr_reader :players, :current_player

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = player_1
  end

  def player_1
    players.first
  end

  def player_2
    players.last
  end

  def attack
    player_2.hp_deduct
    turn_switch
  end

  def turn_switch
    if @current_player == player_1
      @current_player = player_2
    elsif @current_player == player_2
      @current_player = player_1
    end
  end

end
