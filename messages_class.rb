class Messages

	def self.mastermind_welcome
		puts "WELCOME TO THE MASTERMIND GAME."
	end


	def self.intro
		puts "I have generated a beginner sequence with four elements made up of: #{'(r)ed'.red}, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n"
	end






	def self.mastermind_instructions
		puts "Enter a sequence of 4 colours containing the generated colors e.g RYBG or YGRB.\nIf you enter fewer than 4 or more than 4 colors, you would recieve an error message. \n\n\n\n"
	end

	def self.mastermind_background
		puts "THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.\n\n\n\n"
	end

	def self.mastermind_not_same_length
		"Enter the correct number of letters."
		
	end

	def self.mastermind_no_match
			"There are no matches. Try again"
	end

	def self.mastermind_choose_level

		"To start the game, select a level you would like to play:\nEnter (1) for Beginner\nEnter (2) for Intermediate,\nEnter (3) for Advanced\n"

	end

	def self.mastermind_chosen_level(chosen_level)
		case chosen_level
		when "Beginner"
			level_number = 4; level_letters = 4
		when "Intermediate"
			level_number = 5; level_letters = 6
		when "Advanced"
			level_number = 6; level_letters = 8
		else
		end
		"You are in #{chosen_level.to_s.yellow} Level.\nIn this level, your combination must be #{level_letters.to_s.yellow} letters long.\nAnd you have #{level_number.to_s.yellow} colors to choose from."
		
	end

	def self.intro_to_name
		"So you want to play? Let's start.\nFirst, What is your name?".green

		
	end

	def self.times_tried(number_of_times)
		"Number of attempts made: #{number_of_times.to_s.blue}".magenta
	end


	def self.times_left(number_of_times)
		"Number of attempts left: #{number_of_times.to_s}".magenta
	end

	def self.mastermind_user_name(name)
		"K. #{name.upcase.green}, Let's play."
	end


	def self.mastermind_evaluation_status(evaluation_hash)
		exact_matches = evaluation_hash[:exact]

		partial_matches = evaluation_hash[:partial]
#binding.pry
		#"Correct matches : #{exact_matches.to_s.green}\nPartial Matches : #{partial_matches.to_s.yellow}"

		"Correct matches : #{exact_matches.to_s}\nPartial Matches : #{partial_matches.to_s}"

	end


	def self.cheat_message(cheat_array)
		"#{cheat_array.join} --- BUT WHY DO U WANT TO CHEAT???? ARE U A CHEAT????".red
	end





	def self.correct_code_message (computer_secret_code_array)
		"Congratulations!!! You guessed right. The secret code is #{computer_secret_code_array}".green
	end


	def self.mastermind_too_short
		"Entry is too short. Try again!!!".red
	end

	def self.mastermind_too_long
		"Entry is too long. Try again!!!".red
	end



end
