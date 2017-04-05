class Player < ApplicationRecord
	
	has_many :results
	has_many :tournaments, through: :results

	def self.player_vnovikov_rating

		results = Result.all

		results.each do |result|

			result.player_tournament_rating = 
			result.points *
			result.tournament.k_sum *
			result.tournament.k_fading

			result.save!
			
		end

		players = Player.all

		players.each do |player|

			a = []

			player.results.each { |result| a.push(result.player_tournament_rating) }

			player.vnovikov_rating = (a.max(5).sum) / 5 
			
			player.save!
			
		end
						
	end

end
