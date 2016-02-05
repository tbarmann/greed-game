#!/usr/bin/env ruby

require_relative 'lib/game'

print "How many players will play? (default 3): "
STDOUT.flush
player_count = Integer(gets.chomp) rescue 3

game = Game.new(player_count)
game.run
