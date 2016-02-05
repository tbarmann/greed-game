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


	# var Dice = function(){
		
	# 	this.value;
	# 	this.roll = function(){
	# 		this.value = Math.floor(Math.random() * 6) + 1 ;
	# 		return this.value;
	# 	};
	# };
	
	# var DiceGroup = function(numberOfDice){
	# 	this.dice = [];
	# 	this.values = [];
	# 	for (var x=0;x<numberOfDice;x++) {
	# 		this.dice[x] = new Dice();
	# 	}
	# 	this.roll = function(holdIndices){
	# 		for (var j=0;j<this.dice.length;j++) {
	# 			if (!(_.contains(holdIndices,j)))	{
	# 				this.values[j] = this.dice[j].roll();
	# 			}
	# 		}
	# 	return this.values;
	# 	};
	# };
