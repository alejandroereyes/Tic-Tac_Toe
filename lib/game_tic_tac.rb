require_relative 'player'
require_relative 'board'

class Game

  def initialize
    @player_one = Player.new('Player One', "X")
    @player_two = Player.new('Player Two', "O")
    @board = Board.new
    puts "Heye"
    @winner = ""
  end

  def start

    opener

    @board.display(@board.current_board)
    puts ""

    # begin loop if no winner
    #while @winner == ""

      # asker user where to go
      puts "- Player One your turn - "
      print "- Select 1 thru 9 - "
      player_one_move = gets.chomp

      # store user's move
      store_p1_move(player_one_move)

      # display user's move

      # computer will chose a spot

      # store comp's move

      # display comp's use

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
