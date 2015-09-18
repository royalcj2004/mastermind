class Messages
	def self.mastermind_welcome
		puts "WELCOME TO THE #{'MASTERMIND GAME'.cyan} by #{'elChRoy'.magenta}"
	end
	def self.game_intro_message
		puts "Enter #{'p'.green} to #{'play the game'.green}, #{'q'.red} to #{'quit the game'.red}, #{'t'.magenta} to view #{'top scores'.magenta} #{'i'.blue} to load #{'instructions'.blue} or #{'b'.yellow} to view #{'backgrounds'.yellow} of the game. "
	end
	def self.choose_correct_level
		puts "Enter either 1, 2 or 3:"		
	end
	def self.mastermind_instructions
		puts "Enter a sequence of 4 colours containing the generated colors e.g RYBG or YGRB.\nIf you enter fewer than 4 or more than 4 colors, you would recieve an error message. \n\n\n\n"
	end
	def self.mastermind_background
		puts "Just a little background on #{'MA'.magenta}#{'ST'.yellow}#{'ER'.blue}#{'MI'.cyan}#{'ND'.red}.\nMastermind is a board game with an interesting history (or rather a legend?). Some game books report that it was invented in 1971 by Mordecai Meirowitz, an Israeli postmaster and telecommunications expert. After many rejections by leading toy companies, the rights were obtained by a small British firm, Invicta Plastics Ltd. The firm originally manufactured the game itself, though it has since licensed its manufacture to Hasbro in most of the world. However, Mastermind is just a clever readaptation of an old similar game called 'Bulls and cows' in English, and 'Numerello' in Italian... Actually, the old British game 'Bulls and cows' was somewhat different from the commercial version. It was played on paper, not on a board... Over 50 million copies later, Mastermind is still marketed today!
      The idea of the game is for one player (the code-breaker) to guess the secret code chosen by the other player (the code-maker). The code is a sequence of 4 colored pegs chosen from six colors available. The code-breaker makes a serie of pattern guesses - after each guess the code-maker gives feedback in the form of 2 numbers, the number of pegs that are of the right color and in the correct position, and the number of pegs that are of the correct color but not in the correct position - these numbers are usually represented by small black and white pegs.
      In 1977, the mathematician Donald Knuth demonstrated that the code-breaker can solve the pattern in five moves or less, using an algorithm that progressively reduced the number of possible patterns."
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
		"#{'Correct matches'.green} : #{exact_matches.to_s.green}\n#{'Partial Matches'.red} : #{partial_matches.to_s.red}"
	end
	def self.cheat_message(cheat_array)
		"#{cheat_array.join} --- BUT WHY DO U WANT TO CHEAT???? OLEEEEEE!!! ARE U A CHEAT????".red
	end
	def self.display_top_ten(top_ten_hash)
		top_ten_hash.each do |key,value|
			puts "TOP SCORES FOR #{key.upcase.yellow} LEVEL\n"
			first_10 = value.first(10)
			serial_number = 1
					
			first_10.each do |player_details|
					puts "#{serial_number} #{player_details[0].capitalize.magenta} solved '#{player_details[1].magenta}' in #{player_details[3].to_s.cyan}, with #{player_details[2].to_s.magenta} guesses.\n"
					serial_number += 1	
			end
			
			puts "\n\n"
		end
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