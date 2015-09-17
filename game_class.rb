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
		#binding.pry
		computer_code
	end

	def self.intro (level)

		puts "I have generated the #{level[:game_level]} sequence with #{level[:level_details][level[:game_level]][:characters]} characters, out of #{level[:level_details][level[:game_level]][:colors]}, made up of: #{self.list_colors(level[:level_details][level[:game_level]][:list_of_colors])}"
	end




	def self.level_details
		level_details = {
			"Beginner"=>{:characters =>4, :colors=>4, :list_of_colors=> {"R"=>"Red", "Y"=>"Yellow", "G"=>"Green", "B"=>"Blue"}},
			"Intermediate"=>{:characters =>6, :colors=>5, :list_of_colors=> {"R"=>"Red", "Y"=>"Yellow", "G"=>"Green", "B"=>"Blue", "M"=>"Magneta"}},
			"Advanced"=>{:characters =>8, :colors=>6, :list_of_colors=> {"R"=>"Red", "Y"=>"Yellow", "G"=>"Green", "B"=>"Blue", "M"=>"Magneta", "C"=>"Cyan"}}
			}


			level_details

	end


	def self.list_colors(level_colors_hash)
    	colors_in_sentence =[]
    
		level_colors_hash.values.map do |name|
		    x = name.downcase
		    colors_in_sentence << name
		 
		end
		colors_in_sentence.join(", ")
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

							if user_choice_array.join == "c"
								message = Messages.cheat_message(code_choice_array)
							elsif user_choice_array.join == "q"
								quit_game = 1
							else
								message =  Messages.mastermind_too_short 
							end
							
							#binding.pry
						elsif code_choice_array.length < user_choice_array.length
							message =  Messages.mastermind_too_long
							#binding.pry
						else							
						end
						end_time = Time.now
					else
						#binding.pry
						message = Messages.mastermind_evaluation_status(Evaluator.compare(code_choice_array, user_choice_array))
						#binding.pry
						end_time = Time.now
						#message = Evaluator.compare(code_choice_array, user_choice_array)
						#binding.pry
						#trials += 1 reactivate this when you are done with the game
					end



				else
					message = Messages.correct_code_message(code_choice_array.join)
					#binding.pry
					finished = 1
					end_time = Time.now
							
				end


				

				period = (end_time - start_time)
#binding.pry


				
                

                if period > 60
                    
					minutes = (period / 60).floor
					seconds = (period % 60).ceil
					duration_in_words = "#{minutes}min #{seconds}sec"
				else
				    
					seconds = period.floor
					duration_in_words = "#{seconds} seconds"
				end

				trials += 1




				game_status = Hash.new
				game_status[:user_guess] = user_choice_array.join
				game_status[:times_tried] = trials
				game_status[:times_left] = number_of_trials_allowed-trials
				#binding.pry
				game_status[:status_message] = message
				game_status[:period_in_figures] = period

				game_status[:period] = duration_in_words



				puts game_status[:status_message]
				puts Messages.times_tried(game_status[:times_tried])
				puts Messages.times_left(game_status[:times_left])
				puts game_status[:duration]
				#binding.pry

				#game_status[:computer_secret_code] = code_choice_array.join
				#puts game_status[:computer_secret_code]
				#puts game_status[:times_tried]
				#puts game_status[:times_left]
				#binding.pry




				if finished == 1
					game_status[:success] = 1
					puts "You finished the game in #{game_status[:times_tried]} attempt(s) and in #{game_status[:period]}."
					break
					
				end

				if quit_game == 1
					#puts "BYEBYE! SEE YOU LATER. But befor you go, can u rate the game?"

					break
					
					
				end

				

				
				
			


		end

game_status

	end


	

end