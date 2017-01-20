

class Player

  attr_reader :name
  attr_accessor :points

  def initialize(name)
      @name = name
      @points = 100
  end

  def hp_deduct
    @points -= 10
  end


end
