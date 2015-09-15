class Input

	def self.get_user_name
		puts Messages.intro_to_name
		user_name = gets.chomp
		if user_name == "q"
			return
		else
		puts Messages.mastermind_user_name(user_name)
		end
	end

	def self.game_level
		puts Messages.mastermind_choose_level

		level = ""
		
		
		puts "Enter a number here:"
		level_choice = gets.chomp

		level = case level_choice
			when "1"
				"Beginner"
				
			when "2"
				"Intermediate"
				
			when "3"
				"Advanced" 
				
			when "q"
				return
			else
				"Enter 1, 2, or 3."
			end

		

		puts Messages.mastermind_chosen_level (level)
		#end



		

	
	end
end
