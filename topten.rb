require 'json'

json = File.read("topten.json")
obj = JSON.parse(json)
puts obj

class TopTen

	def self.get_player_details(flow_hash)
		name = flow_hash[:user_name]
		game_level = flow_hash[:game_level]

		binding.pry



	end


end
