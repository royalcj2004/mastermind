class Evaluator
	def self.compare(secret_code, guess)
		secret_hash = get_hash_from_array_with_number_of_occurences(secret_code)
		guess_hash = get_hash_from_array_with_number_of_occurences(guess)
		hash_of_total_matches = get_hash_of_total_matches_between(secret_hash,guess_hash)
	    number_of_total_matches = hash_of_total_matches.values.reduce(:+)
	    number_of_total_matches ||= 0
	   	number_of_exact_matches = get_number_of_exact_matches(secret_code, guess)
	   	number_of_partial_matches = number_of_total_matches - number_of_exact_matches
	   	hash_of_exact_and_partial = {}
	   	hash_of_exact_and_partial[:exact] = number_of_exact_matches
	   	hash_of_exact_and_partial[:partial] = number_of_partial_matches
	   	hash_of_exact_and_partial
	end

	private

	def self.get_hash_from_array_with_number_of_occurences(code_array)
		code_hash = Hash.new(0)
		code_array.inject(code_hash) do |m,v|
			m[v] += 1
			m
		end
		code_hash
	end

	def self.get_hash_of_total_matches_between(comp_hash, user_hash)
		hash_of_total = {}
		user_hash.map do |key,value|
	        if  comp_hash.has_key?(key)
                hash_of_total[key] = user_hash[key] if value <= comp_hash[key]
                hash_of_total[key] = comp_hash[key] if value > comp_hash[key]
            end
	    end
	    hash_of_total
	end

	def self.get_number_of_exact_matches(comp, guess)
		exact = 0
		combined = comp.zip(guess)
		combined.each do |one_combination|
				if one_combination[0] == one_combination[1]
					exact += 1
				end
		end
		exact
	end

end
