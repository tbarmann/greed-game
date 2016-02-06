class DiceSet
  attr_reader :values

  def roll number_of_dice = 5
    if number_of_dice > 0
	    @values = []
	    number_of_dice.times do
	    	@values.push(Random.rand(1...6))
	 	end
  	end
  end
end
