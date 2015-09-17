require 'json'



class TopTen





	def self.get_top_ten_sorted
					hash_from_json = File.read("top_ten_list.json")
					full_table_hash = JSON.parse(hash_from_json)
					topten_sorted = {"Beginner"=>[],"Intermediate"=>[],"Advanced"=>[]}
					top = ""

					#topten_sorted = []
					full_table_hash.each do |hash_key, hash_value|
						array_of_hashes = hash_value.each { |h|  h.map { |k,v| v }  }
						array_of_arrays = array_of_hashes.map{|hash| hash.values}
						#binding.pry
=begin
						binding.pry

						sort_by_score = array_of_arrays.transpose[2]
						sort_by_times = array_of_arrays.transpose[4]

						sort_array = sort_by_score.zip(sort_by_times)
						binding.pry


						array_of_hashes.each do |hash|
							hash.each do |key,val|
								puts "#{key} => #{val}"
							end
						end

=end



						




			#array_of_arrays = full_table_hash[level_to_add].map { |h|  h.map { |k,v| v }  }
						name, secret_code, number_of_attempts, game_time_in_words, game_time_in_figures = array_of_arrays.transpose
						



						number_of_attempts.sort!.each do |x|
							
    						if number_of_attempts.any? {|i| i == x} == true
  							
									game_time_in_figures.sort!.each do |m|   #topten_sorted << 
   											top = array_of_arrays.select {|arr_period| arr_period[4] == m}.flatten
   											number_of_attempts.delete_at(0)
   											#binding.pry
   											topten_sorted[hash_key] << top
   											

   											
   #binding.pry  
									end        
    						else            
            #topten_sorted << 
            						top = array_of_arrays.select {|arr| arr[2] == x}.flatten
            						#binding.pry
            						#number_of_attempts.delete_at(0)
            						topten_sorted[hash_key] << top
           # binding.pry
    						end    
						end
					end
					
					Messages.display_top_ten(topten_sorted)
#binding.pry
			


	end










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

			#binding.pry
			
			array_of_attempts.sort![0..9]
			#binding.pry


		end

			

		end


		top_ten_hash.to_json



		



		file = File.open("top_ten_list.json", "r+")

		file.write(top_ten_hash.to_json)
		file.close





		
	end


end
