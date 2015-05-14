require_relative 'player'
require_relative 'board'
require_relative 'rule'

class Game

  def initialize
    @player_one = Player.new('Player One', "X")
    @player_two = Player.new('Player Two', "O")
    @board = Board.new
    @rules = Rule.new
    @winner = ""
    @out_of_moves = false
  end

  def start

    opener

    @board.display(@board.current_board)
    puts ""

    # begin loop if no winner
    #while @winner == "" || !@out_of_moves

      # asker player 1
      puts "- Player One your turn - "
      print "- Select 1 thru 9 - "
      player_one_move = gets.chomp
      puts ""

      # store player 1 move
      store_p1_move(player_one_move)

      # update board
      update_board(@player_one.moves.last, @player_one.token)

      # display board
      @board.display(@board.current_board)
      puts ""

      # asker player 2
      puts "- Player Two your turn - "
      print "- Select 1 thru 9 - "
      player_two_move = gets.chomp
      puts ""

      #store player 2 move
      store_p2_move(player_two_move)

      # update board
      update_board(@player_two.moves.last, @player_two.token)

      # display board
      @board.display(@board.current_board)
      puts ""

      # check for winner
    #end loop

    if @winner != ""
      display_winner
    end
  end

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
  end

end
