require_relative 'player'
require_relative 'board'

class Game

  def initialize
    @player_one = Player.new('Player One', "X")
    @player_two = Player.new('Player Two', "O")
    @computer = Player.new('Hal', "O")
    @board = Board.new
    @game_mode = false
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

    decide_game_mode

    @board.display(@board.current_board)
    puts ""

    # begin loop if no winner
    while @winner == "" && @out_of_moves < 9

      # asker player 1
      puts "- Player One your turn - "
      print "- Select 1 thru 9 : "
      player_one_move = gets.chomp.to_i

      # Validate player's move is 1 -9
      while player_one_move <= 0 || player_one_move >= 10 || !good_move(player_one_move)
        system ('say "I do not like that number"')
        puts "- Player One your turn - "
        print "- Select 1 thru 9 : "
        player_one_move = gets.chomp.to_i
      end

      # Track number of moves
      @out_of_moves += 1
      puts ""

      # store player 1 move
      store_p1_move(player_one_move)

      # update board
      update_board(@player_one.moves.last, @player_one.token)

      # display board
      @board.display(@board.current_board)
      puts ""

      # check for winner
      # @rule.
      did_anyone_win(@player_one.name, @player_one.moves)

      #if no winner continue & there are still moves left
      break if @winner != "" || @out_of_moves >= 9

      if !@game_mode # determine whether human or computer will play
        # asker player 2
        puts "- Player Two your turn - "
        print "- Select 1 thru 9 : "
        player_two_move = gets.chomp.to_i

        # Validate player's move is 1 -9
        while player_two_move <= 0 || player_two_move >= 10 || !good_move(player_two_move)
          system ('say "I do not like that number"')
          puts "- Player One your turn - "
          print "- Select 1 thru 9 : "
          player_two_move = gets.chomp.to_i
        end
      else # play against computer
        # comp picks a move
        computer_move = @board.current_board.sample

        # Validate computer's move doesn't match a currnet move
        while computer_move == @player_one.token || computer_move == @computer.token
          computer_move = @board.current_board.sample
        end

        computer_move = computer_move.to_i
      end # input for game mode cond

        # Track number of moves
        @out_of_moves += 1
        puts ""

        if !@game_mode # Determine if human player or computer
          #store human player 2 move
          store_p2_move(player_two_move)

          # update board
          update_board(@player_two.moves.last, @player_two.token)
        else # computer player
          # store computer's move
          store_computer_move(computer_move)

          # update board
          update_board(@computer.moves.last, @computer.token)
        end

        # display board
        @board.display(@board.current_board)
        puts ""

        if !@game_mode # Determine if human player or computer
          # check for winner
          #@rule.
          did_anyone_win(@player_two.name, @player_two.moves)
        else # computer player
          did_anyone_win(@computer.name, @computer.moves)
        end

    end # while loop

      display_winner
  end # start method

  def opener
    system ('clear')
    puts "\n \n \n \n \n"
    puts "      -----------------"
    puts "      |  Tic Tac Toe  |"
    puts "      -----------------"
    puts "\n"
  end

  def decide_game_mode
    puts "Enter 1 to play against the computer or"
    print "Enter 2 for two player mode : "
    mode_input = gets.chomp.to_i

    while mode_input != 1 && mode_input != 2
      system ('say "Invalid entry"')
      print "Enter 2 for two player mode : "
      mode_input = gets.chomp.to_i
    end

    if mode_input == 1
      @game_mode = true # computer player
    else
      @game_mode = false # human player
    end
  end # decide game mode

  def store_p1_move(move)
    i = move
    i -= 1
    @player_one.moves.push(i)
  end

  def store_p2_move(move)
    i = move
    i -= 1
    @player_two.moves.push(i)
  end

  def store_computer_move(move)
    i = move
    i -= 1
    @computer.moves.push(i)
  end

  def update_board(move_by_index, token)
    @board.current_board[move_by_index] = token
  end

  def display_winner
    if @winner == @player_one.name
      puts "Congratulations #{@player_one.name} is the winner!"
    elsif @winner == @player_two.name
      puts "#{@player_two.name} won...better luck next time #{@player_one.name}."
    elsif @winner == @computer.name
      puts "#{@computer.name} says, 'You just got Skynetted!'"
      system ('say "Boo"')
      system ('say "Yaw"')
    else
      puts "...Looks like we have a tie..."
    end
    puts ""
    puts "                Game Over"
  end

  def good_move(player_move)
    move = player_move.to_s
    @board.current_board.include?(move)
  end

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
      if @counter == 3 # if three matches while looking at a mini array, player has won
        @winner = player_name
      end # winner cond
    end # 1st loop
  end # method
end # Game Class
