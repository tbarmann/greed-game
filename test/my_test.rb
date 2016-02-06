require_relative '../lib/game.rb'
require 'pry'

g = Game.new(2)

# Throw       Score
# ---------   ------------------
# 5 1 3 4 1   50 + 2 * 100 = 250
# 1 1 1 3 1   1000 + 100 = 1100
# 2 4 4 5 4   400 + 50 = 450

result = g.score_roll([1,1,1,1,1,1])

puts "Score: " + result[:score].to_s
puts "Non-scoring dice: #{result[:non_scoring_dice]}"

result = g.score_roll([5,1,3,4,1])

puts "Score: " + result[:score].to_s
puts "Non-scoring dice: #{result[:non_scoring_dice]}"


result = g.score_roll([1,1,1,3,1])

puts "Score: " + result[:score].to_s
puts "Non-scoring dice: #{result[:non_scoring_dice]}"


result = g.score_roll([2,4,4,5,4])

puts "Score: " + result[:score].to_s
puts "Non-scoring dice: #{result[:non_scoring_dice]}"

