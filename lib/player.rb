# frozen_string_literal: true

class Player
  attr_reader :name, :color

  def initialize(player_name, player_color)
    @name = player_name
    @color = player_color
  end
end
