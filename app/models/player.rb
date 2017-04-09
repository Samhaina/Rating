class Player < ApplicationRecord

 has_many :results
 has_many :tournaments, through: :results

 def self.vnovikov_rating

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

   player.vnovikov_rating = a.max(5).sum / 5 

   player.save!

  end

 end

 

 def self.test_rating



  players = Player.all

  players.each do |player|

   a1, a2, b, b1, b2 = [], [], [], [], []

   player.results.each do |result| 

    tournament = Tournament.find(result.tournament_id)

    if tournament.k_fading > 0

      a1.push (result.points * tournament.k_sum * tournament.k_fading)
      
      a2.push (tournament.k_sum * tournament.k_fading)

      b.push ([result.points, tournament.k_sum, tournament.k_fading])

    end   

   end

   if a2.sum == 0
    rating_all = 0
   else
    rating_all = a1.sum / (a1.size < 5 ? a2.sum + (5-a2.size) : a2.sum)
   end
  

   b = b.max(3)

   
   b.each do |variable|

    p b1.push variable.inject(1){ |result, elem| (result * elem) }
    variable.shift
    p b2.push variable.inject(1){ |result, elem| (result * elem) }

   end  

   b2.sum == 0 ? rating_best = 0 : rating_best = b1.sum / b2.sum

   

   player.rating = (rating_all + rating_best) / 2

   player.save!
  
  end
   
 end






end
