class Result < ApplicationRecord
	belongs_to :player
	belongs_to :tournament

	#EMA-schema
	def self.player_tournament_points

		results = Result.all

		results.each do |result|

			number_of_participants = Tournament.find_by_id(result.tournament_id).number_of_participants

			result.points = 1000.0 * (number_of_participants - result.place) / (number_of_participants - 1)

			result.save!
		end
			
	end

end

