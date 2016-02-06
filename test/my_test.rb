require_relative '../lib/game.rb'
require 'pry'

g = Game.new(2)

#binding.pry
g.players[0].play_turn