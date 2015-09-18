class Game
	def self.gets_color_hash_from_main_flow_hash(flow_hash)
		color_number_pair = {}
		color_number_pair[:colors] = flow_hash[:level_details][flow_hash[:game_level]][:list_of_colors]
		color_number_pair[:number_to_choose] = flow_hash[:level_details][flow_hash[:game_level]][:characters]
		color_number_pair
	end
	def self.add_to_flow_hash(flow_hash)
		flow_hash[:exact]
	end
	def self.generate_comp_code (flow_hash)
		computer_code = []
		colors = flow_hash[:colors]
		code_colors = colors.keys
		(flow_hash[:number_to_choose]).times do
				computer_code << code_colors[rand(code_colors.length)].downcase
		end
		computer_code
	end
	def self.intro (level)
		puts "I have generated the #{level[:game_level]} sequence with #{level[:level_details][level[:game_level]][:characters]} characters, out of #{level[:level_details][level[:game_level]][:colors]}, made up of: #{self.list_colors(level[:level_details][level[:game_level]][:list_of_colors])}"
	end
	def self.level_details
		level_details = {
			"Beginner"=>{:characters =>4, :colors=>4, :list_of_colors=> {"R"=>"Red", "Y"=>"Yellow", "G"=>"Green", "B"=>"Blue"}},
			"Intermediate"=>{:characters =>6, :colors=>5, :list_of_colors=> {"R"=>"Red", "Y"=>"Yellow", "G"=>"Green", "B"=>"Blue", "M"=>"Magenta"}},
			"Advanced"=>{:characters =>8, :colors=>6, :list_of_colors=> {"R"=>"Red", "Y"=>"Yellow", "G"=>"Green", "B"=>"Blue", "M"=>"Magenta", "C"=>"Cyan"}}
			}
		level_details
	end
	def self.list_colors(level_colors_hash)
    	colors_in_sentence_hash = {}
    	colors_in_sentence_array = []
		level_colors_hash.values.map do |name|
		    x = name.downcase
		    colors_in_sentence_hash["#{name}"] = x
		end
		colors_in_sentence_hash.map do |k,v|
			colors_in_sentence_array << k.send(v)
		end
		in_sentence = colors_in_sentence_array.join(", ")
		in_sentence
	end
	def self.get_user_guess
		puts "What's your guess?"
		user_input_string = gets.chomp
		user_guess_array = user_input_string.downcase.split("")
		user_guess_array
	end
	def self.compare (computers_code)
		code_choice_array = computers_code
		trials = 0
		number_of_trials_allowed = 12
		start_time = Time.now
		while trials < number_of_trials_allowed
				user_choice_array = self.get_user_guess
				if code_choice_array != user_choice_array
					if code_choice_array.length != user_choice_array.length
						if code_choice_array.length > user_choice_array.length
							wrong_data = 1
							if user_choice_array.join == "c"
								message = Messages.cheat_message(code_choice_array)
							elsif user_choice_array.join == "q"
								quit_game = 1
							else
								message =  Messages.mastermind_too_short 
							end
						elsif code_choice_array.length < user_choice_array.length
							message =  Messages.mastermind_too_long
						else							
						end
						end_time = Time.now
					else
						message = Messages.mastermind_evaluation_status(Evaluator.compare(code_choice_array, user_choice_array))
						end_time = Time.now
						trials += 1 #reactivate this when you are done with the game
					end
				else
					message = Messages.correct_code_message(code_choice_array.join)
					end_time = Time.now
					finished = 1
				end
				period = (end_time - start_time)
                if period > 60
					minutes = (period / 60).floor
					seconds = (period % 60).ceil
					duration_in_words = "#{minutes}min #{seconds}sec"
				else
					seconds = period.floor
					duration_in_words = "#{seconds} seconds"
				end
				game_status = Hash.new
				game_status[:user_guess] = user_choice_array.join
				game_status[:times_tried] = trials
				game_status[:times_left] = number_of_trials_allowed-trials
				game_status[:status_message] = message
				game_status[:period_in_figures] = period
				game_status[:period] = duration_in_words
				puts game_status[:status_message]
				#unless wrong_data == 1
					puts Messages.times_tried(game_status[:times_tried])
					puts Messages.times_left(game_status[:times_left])
				#end
				puts game_status[:duration]
				if finished == 1
					game_status[:success] = 1
					puts "You finished the game in #{game_status[:times_tried]} attempt(s) and in #{game_status[:period]}."
					break
=begin					
					puts "Do you want to (p)lay again or (q)uit?"
					choice = gets.chomp
					case choice
					when "p"
						self.compare(code_choice_array)
						#Mastermind.mastermind_game
					when "q"
						break
					end
=end
				end
				if quit_game == 1
					puts "Are u sure u want to (q)uit? You can (p)lay again."
					choice = gets.chomp
					case choice
					when "p"
						Mastermind.mastermind_game
					when "q"
						puts "Thank You For Playing. BYE!!! :-)"
						exit
					#when "r"
						#rating = gets.chomp
					else
						puts "Enter either p, or q."
						redo
					end
				end
		end
game_status
	end
end