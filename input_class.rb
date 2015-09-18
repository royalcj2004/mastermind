class Input
	def self.get_user_name
		puts Messages.intro_to_name
		user_name = gets.chomp
		puts Messages.mastermind_user_name(user_name)
		user_name
	end
	def self.game_level
		puts Messages.mastermind_choose_level
		level = ""
		loop do
				level_choice = gets.chomp
				case level_choice
					when "1"
						level = "Beginner"
						break
					when "2"
						level = "Intermediate"
						break
					when "3"
						level = "Advanced" 
						break
					else
						Messages.choose_correct_level
						redo
		    	end
		end#end of the  loop
		puts Messages.mastermind_chosen_level (level)
		    level
	end
end
