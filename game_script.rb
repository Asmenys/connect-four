# frozen_string_literal: true

require_relative 'lib/game'
system 'clear'
p "Enter player one's name"
name = gets.chomp
p "Enter player two's name"
name_two = gets.chomp
game = Game.new(name, name_two)
system 'clear'
game.play
