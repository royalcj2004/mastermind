require 'pry'
require "colorize"
require_relative 'input_class'
require_relative 'evaluator_class'
require_relative 'game_class'
require_relative 'messages_class'




class Mastermind
	Messages.mastermind_welcome
	


	
	loop do
		puts "Enter #{'p'.green} to #{'start the game'.green}, #{'q'.red} to #{'quit the game'.red}, #{'i'.blue} to load #{'instructions'.blue} or #{'b'.yellow} to view #{'backgrounds'.yellow} of the game. "

		start_input = gets.chomp
		
		case start_input
			when "p"

				#Input.get_user_name
				#Input.game_level
				#Game.intro
				Game.compare

			when "i"
				Messages.mastermind_instructions
			when "b"
				Messages.mastermind_background        
			when "q"
				#binding.pry
				break
			else
				puts "Enter either 'p', 'q', 'b', or 'i'."
		end
	end
end