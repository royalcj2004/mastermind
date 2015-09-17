require 'pry'
require "colorize"
require_relative 'topten'

require_relative 'input_class'
require_relative 'evaluator_class'
require_relative 'game_class'
require_relative 'messages_class'





class Mastermind
	Messages.mastermind_welcome


	flow_hash = {}


	
	
	loop do
		puts Messages.game_intro_message
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
				#binding.pry

				game_status_to_hash = Game.compare(secret_code)
				flow_hash[:game_status] = game_status_to_hash
				


				TopTen.get_player_score_details(flow_hash)



				


			when "i"
				Messages.mastermind_instructions
			when "t"
				#binding.pry
				TopTen.get_top_ten_sorted

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