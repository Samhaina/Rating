class PlayerRatingsController < ApplicationController
	
		def index
		@players = Player.where("vnovikov_rating != ? AND city != ?", 0, 'nil').order("rating DESC")

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @players }
		end

		@tournaments = Tournament.all.order("date_end DESC")

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @tournaments }
		end

	end


end




