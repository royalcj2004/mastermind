class Evaluator
	def self.compare(secret_code, guess)
	    secret_hash = Hash.new(0)
	    secret_code.inject(secret_hash) do |m,v| 
	        m[v] += 1
	        m
	    end

	    guess_hash = Hash.new(0)
	    guess.inject(guess_hash) do |m,v|
	        m[v] += 1
	        m
	    end
	    matched_hash = {}
	    guess_hash.map do |key,value|
	        if  secret_hash.has_key?(key)
                matched_hash[key] = guess_hash[key] if value <= secret_hash[key]
                matched_hash[key] = secret_hash[key] if value > secret_hash[key]
            else
                #This is the code to get the pairs that are not correct.
	        end
	    end
<<<<<<< HEAD
	    
=======
>>>>>>> c184ff8bb477efa5cbd8a148f838d44498bffdf0
	    number_of_correct_guesses = matched_hash.values.reduce(:+)
	   
	   	exact = 0
		unexact = 0
		partial = 0
		exact_array = []
		partial_array_comp = []
		partial_array_user = []
		result_hash = Hash.new
		new_hash = Hash[secret_code.zip(guess)]
		
		combined = secret_code.zip(guess)
		combined.each do |one_combination|

				if one_combination[0] == one_combination[1]
					exact += 1
					exact_array << one_combination
				else
					unexact += 1
					partial_array_comp << one_combination[0]
					partial_array_user << one_combination[1]
				end
		end
		partial_array_user.select do |i| 
		partial += 1 if partial_array_comp.include? (i)
		end
<<<<<<< HEAD
		
		if number_of_correct_guesses == nil
		    number_of_correct_guesses = 0
		end

		result_hash[:exact] = exact
		result_hash[:unexact] = unexact
		result_hash[:partial] = number_of_correct_guesses-exact
		#binding.pry
		result_hash[:number_of_correct_guesses] = number_of_correct_guesses
		
		


		result_hash

	
=======
		result_hash[:exact] = exact
		result_hash[:unexact] = unexact
		result_hash[:partial] = number_of_correct_guesses - exact
		result_hash[:number_of_correct_guesses] = number_of_correct_guesses
		result_hash
>>>>>>> c184ff8bb477efa5cbd8a148f838d44498bffdf0
	    
	end
	
end