require_relative 'player'
require_relative 'board'
# require_relative 'rule'

class Game

  def initialize
    @player_one = Player.new('Player One', "X")
    @player_two = Player.new('Player Two', "O")
    @board = Board.new
    # @rule = Rule.new
    @winner = ""
    @out_of_moves = 0
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

  def start

    opener

    @board.display(@board.current_board)
    puts ""

    # begin loop if no winner
    while @winner == "" && @out_of_moves < 9

      # asker player 1
      puts "- Player One your turn - "
      print "- Select 1 thru 9 : "
      player_one_move = gets.chomp
      @out_of_moves += 1
      puts ""

      # store player 1 move
      store_p1_move(player_one_move)

      # update board
      update_board(@player_one.moves.last, @player_one.token)

      # display board
      @board.display(@board.current_board)
      puts ""

      #check for winner
      # @rule.
      did_anyone_win(@player_one.name, @player_one.moves)

      #if no winner continue & there are still moves left
      # if @winner = "" && @out_of_moves < 9
      break if @winner != "" || @out_of_moves >= 9
        # asker player 2
        puts "- Player Two your turn - "
        print "- Select 1 thru 9 : "
        player_two_move = gets.chomp
        @out_of_moves += 1
        puts ""

        #store player 2 move
        store_p2_move(player_two_move)

        # update board
        update_board(@player_two.moves.last, @player_two.token)

        # display board
        @board.display(@board.current_board)
        puts ""

        # check for winner
        #@rule.
        did_anyone_win(@player_two.name, @player_two.moves)
      # end # no winner & moves left cond
    end # while loop
    puts "#{@winner} shown as winner" # this is to debug
    if @winner != "" || @out_of_moves >= 9
      display_winner
    end # if winner condition
  end # start method

  def opener
    puts "      -----------------"
    puts "      |  Tic Tac Toe  |"
    puts "      -----------------"
  end

  def store_p1_move(move)
    i = move.to_i
    i -= 1
    @player_one.moves.push(i)
  end

  def store_p2_move(move)
    i = move.to_i
    i -= 1
    @player_two.moves.push(i)
  end

  def update_board(move_by_index, token)
    @board.current_board[move_by_index] = token
  end

  def display_winner
    if @winner = @player_one.name
      puts "Congratulations #{@player_one.name} won!"
    elsif @winner = @player_two.name
      puts "#{@player_two.name} won...better luck next time #{@player_one.name}."
    else
      puts "...Looks like we have a tie..."
    end
  end # display method

  def did_anyone_win(player_name, player_moves) # if player's positions match in any of these positions they win

    @win_array.each do |mini_array| # look at each mini array within win_array
      @counter = 0 # Initialize counter each time you look at a mini array

      mini_array.each do |win_pos| # look at each element in mini array

        # loop thru player array compare each individual position
        # to number in array
        player_moves.each do |position|

          if position == win_pos #if they match add one to counter
            @counter += 1

          end # count up cond
        end # 3rd loop
      end # 2nd loop
      puts "#{player_name} #{@counter} #{@winner}" #this is to debug
      if @counter == 3 # if three matches while looking at a mini array, player has won
        @winner = player_name
        puts "#{@counter} at time winner is selected" #this is to debug
      end # winner cond
    end # 1st loop
  end # method
end # Game Class
