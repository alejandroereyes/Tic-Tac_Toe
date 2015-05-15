class Rule

  def initialize
   @win_array = [[0,1,2],
               [3,4,5],
               [6,7,8],
               [0,4,8],
               [2,4,6],
               [0,3,6],
               [1,4,7],
               [2,5,8]]
    @counter = 0
  end


  def did_anyone_win(player_name, player_moves) # if player's positions match in any of these positions they win

    @win_array.each do |mini_array| # look at each mini array within win_array
      # counter = 0 # Initialize counter each time you look at a mini array

      mini_array.each do |win_pos| # look at each element in mini array
        @counter = 0
        # loop thru player array compare each individual position
        # to number in array
        player_moves.each do |position|

          if position == win_pos #if they match add one to counter
            @counter += 1

          end # count up cond
        end # 3rd loop
      end # 2nd loop
      puts "#{player_name} #{@counter}" #this is to debug
      if @counter == 3 # if three matches while looking at a mini array, player has won
        @winner = player_name
        puts "#{@counter} at time winner is selected" #this is to debug
      end # winner cond

    end # 1st loop
  end # method
end # class

