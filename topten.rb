require 'json'



class TopTen



	def self.get_player_score_details(the_flow_hash)

		json = File.read("top_ten_list.json")
		top_ten_hash = JSON.parse(json)
		

		success_status = the_flow_hash[:game_status][:success]
		name = the_flow_hash[:user_name]
		game_secret_code = the_flow_hash[:secret_code].join
		attempts_to_compare = the_flow_hash[:game_status][:times_tried]
		period = the_flow_hash[:game_status][:period]
		period_in_figures = the_flow_hash[:game_status][:period_in_figures]
		game_level = the_flow_hash[:game_level]
		to_high_score_hash = {:name => name, :game_secret_code=>game_secret_code, :attempts=>attempts_to_compare, :period=>period, :period_in_figures=>period_in_figures }
		



		if success_status == 1

			if top_ten_hash[game_level] == []
				top_ten_hash[game_level] << to_high_score_hash

			else



			array_of_attempts = []
			top_ten_hash[game_level].map do |score_hash|
				score_hash.select do |key,value|
					array_of_attempts << score_hash[key] if key == "attempts"
				end				
			end



			array_of_period_in_figures = []
			top_ten_hash[game_level].map do |score_hash|
				score_hash.select do |key,value|
					array_of_period_in_figures << score_hash[key] if key == "array_of_period_in_figures"

				end				
			end


			if array_of_attempts.any? { |number| attempts_to_compare < number} == true
				array_of_attempts << attempts_to_compare
				top_ten_hash[game_level] << to_high_score_hash

			elsif array_of_attempts.any? { |number| attempts_to_compare == number}

				if array_of_period_in_figures.any? { |number| period_in_figures < number} == true
					array_of_period_in_figures << period_in_figures
					top_ten_hash[game_level] << to_high_score_hash
				end


			end

			binding.pry
			
			array_of_attempts.sort![0..9]
			#binding.pry\


		end

			

		end


		top_ten_hash.to_json



		



		file = File.open("top_ten_list.json", "r+")

		file.write(top_ten_hash.to_json)
		file.close
		



		






	end


end
