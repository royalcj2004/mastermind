class Game


	def self.generate_comp_code
		computer_code = []
		colours = {"R"=>"Red", "Y"=>"Yellow", "G"=>"Green", "B"=>"Blue"}
		code_colours = colours.keys
		(colours.length).times do
				computer_code << code_colours[rand(code_colours.length)].downcase
		end
		computer_code
	end

	def self.intro
		puts "I have generated a beginner sequence with four elements made up of: #{'(r)ed'.red}, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n"
	end

	def self.get_user_guess
		puts "What's your guess?"
		user_input_string = gets.chomp
		user_guess_array = user_input_string.downcase.split("")
		user_guess_array
	end




	def self.compare
		code_choice_array = generate_comp_code

		trials = 0
		number_of_trials_allowed = 12

		while trials < number_of_trials_allowed
		
				user_choice_array = get_user_guess
		
				if code_choice_array != user_choice_array

					if code_choice_array.length != user_choice_array.length
						if code_choice_array.length > user_choice_array.length
							message =  Messages.mastermind_too_short
						elsif code_choice_array.length < user_choice_array.length
							message =  Messages.mastermind_too_long
						else							
						end
						
					else
						message = Messages.mastermind_evaluation_status(Evaluator.compare(code_choice_array, user_choice_array))

					end

				else
					message = Messages.correct_code_message(code_choice_array.join)
					break
					
				end


				trials += 1

				game_status = Hash.new
				game_status[:user_guess] = user_choice_array.join
				game_status[:computer_secret_code] = code_choice_array.join
				game_status[:times_tried] = trials
				game_status[:times_left] = number_of_trials_allowed - trials
				game_status[:status_message] = message

				puts game_status#[:status_message]

			


		end



	end


	

end