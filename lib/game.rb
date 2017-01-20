class Game

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  attr_reader :players, :current_player, :opposition

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = player_1
    @opposition = player_2
  end

  def player_1
    players.first
  end

  def player_2
    players.last
  end

  def attack
    opposition.hp_deduct
    turn_switch
  end

  def game_over?
      player_1.points == 0 || player_2.points == 0
  end

  def turn_switch
  @current_player, @opposition = @opposition, @current_player
  end


end
