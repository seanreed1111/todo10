# # Binary Secret Handshake
 
# > There are 10 types of people in the world: Those who understand binary, and those who don't.
 
# You and your fellow flatirons are of those in the "know" when it comes to binary decide to come up with a secret "handshake".
 
# ```
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
 
 
# 10000 = Reverse the order of the operations in the secret handshake.
# ```
 
# Write a program that will convert a binary number, represented as a string (i.e. "101010"), and convert it to the appropriate sequence of events for a secret handshake.
 
 
# ```
# handshake = SecretHandshake.new "1001"
# handshake.commands # => ["wink","jump"]
 
# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]
# ```
 
# The program should consider strings specifying an invalid binary as the value 0.
 
 class SecretHandshake
 	#establish the matrix of actions
 	# 1 = wink
		# 10 = double blink
		# 100 = close your eyes
		# 1000 = jump
 		# 10000 = Reverse the order of the operations in the secret handshake.

 	@@all_commands = [["1".to_i(2), "wink"], ["10".to_i(2), "double blink"], 
 						["100".to_i(2), "close your eyes"], ["1000".to_i(2), "jump"],["10000".to_i(2), "reverse"] ]
 	#note: this should ideally be a hash

 	attr_accessor :commands
 	attr_reader :value

 	def initialize(string_binary = "")
 		@value = string_binary.to_i(2)
 		@commands  = self.parse
 	end


 	def parse
 		#parse returns an array wih the appropriate actions for the SecretHandshake Class
 		# 1 = wink
		# 10 = double blink
		# 100 = close your eyes
		# 1000 = jump
 		# 10000 = Reverse the order of the operations in the secret handshake.
 		
 		array = [] #this will return an array of the proper commands to the initializer, or a null array

 		@@all_commands.each do |commands|
 			array << commands[1] if value & commands[0] == commands[0]
 		end
 		
 		if array.include?("reverse") 
 			array.reverse!.select! {|item| item != "reverse"}
 		end

 		array
 	end

 end

