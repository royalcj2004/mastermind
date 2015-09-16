require 'pry'
require "colorize"
<<<<<<< HEAD
require_relative 'topten'
=======
>>>>>>> c184ff8bb477efa5cbd8a148f838d44498bffdf0
require_relative 'input_class'
require_relative 'evaluator_class'
require_relative 'game_class'
require_relative 'messages_class'




<<<<<<< HEAD


class Mastermind
	Messages.mastermind_welcome


	flow_hash = {}


=======
class Mastermind
	Messages.mastermind_welcome
	
>>>>>>> c184ff8bb477efa5cbd8a148f838d44498bffdf0


	
	loop do
		puts "Enter #{'p'.green} to #{'start the game'.green}, #{'q'.red} to #{'quit the game'.red}, #{'i'.blue} to load #{'instructions'.blue} or #{'b'.yellow} to view #{'backgrounds'.yellow} of the game. "

		start_input = gets.chomp
		
		
		case start_input
			when "p"
				flow_hash[:user_name] = Input.get_user_name
				flow_hash[:game_level] = Input.game_level
				flow_hash[:level_details] = Game.level_details
				

				flow_hash[:hash_to_generate_secret_code] = Game.gets_color_hash_from_main_flow_hash(flow_hash)
				#binding.pry

				secret_code = Game.generate_comp_code (flow_hash[:hash_to_generate_secret_code])
				flow_hash[:secret_code] = secret_code




				Game.intro(flow_hash)
				binding.pry

				Game.compare(secret_code)

				Topten.get_player_details(flow_hash)



				


			when "i"
				Messages.mastermind_instructions
			when "b"
				Messages.mastermind_background        
			when "q"
				#binding.pry
				break
			else
				puts "Enter either 'p', 'q', 'b', or 'i'."
				redo
				
		end

	end
end