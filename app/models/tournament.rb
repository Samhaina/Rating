class Tournament < ApplicationRecord
	

	has_many :results
	has_many :players, through: :results

	require 'date'

	def self.tournament_coeff_vnovikov

	tournaments = Tournament.all

		tournaments.each do |tournament|

# 1st addend
			k_number_of_participants = 0
			
			k_number_of_participants_array = [
				[12,0.8],[16,1.0],[20,1.3],[24,1.6],[28,1.8],
				[32,2.0],[36,2.1],[44,2.2],[48,2.3],[56,2.4],
				[64,2.5],[128,3.0],[256,3.5]
			]

			k = k_number_of_participants_array.find_all{
				|elem| elem[0] <= tournament.number_of_participants 
			}.max

			k_number_of_participants = k[1]

# 2nd addend
			k_number_of_nonresidents = tournament.k_nonresidents
			
# 3rd addend			
# Some tournaments havn't number_of_rounds, so their k_sums were added manually
			k_number_of_rounds = 0

			case tournament.number_of_rounds
			when 6..8  						
				k_number_of_rounds = 0.1
			when 9..12
				k_number_of_rounds = 0.2				
			end

# 4th addend
			k_ema = 0
			case tournament.ema
			when 1
				k_ema = 0.3
			when 2
				k_ema = 0.5
			when 5
				k_ema = 1.0
			end

# Sum
			tournament_coefficient = 
			k_number_of_participants + 
			k_number_of_nonresidents + 
			k_number_of_rounds + 
			k_ema

			tournament.k_sum = tournament_coefficient

			tournament.save!
		end

	end


	def self.tournament_fading_coeff_vnovikov

		tournaments = Tournament.all

		date_result_calculation = Date.new(2017,3,31)

		tournaments.each do |tournament|

			months = 
			(date_result_calculation.month-tournament.date_start.month) + 
			12*(date_result_calculation.year-tournament.date_start.year)

			tournament.k_fading = 1.0 - (months / 3).truncate * 0.05

			tournament.save!


		end

	end

end
