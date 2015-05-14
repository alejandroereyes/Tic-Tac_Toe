class Board
  attr_accessor :current_board

  def initialize
    @current_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def display(board_array)
    print "          " + board_array[0] + " |"
    print " " + board_array[1] + " |"
    puts " " + board_array[2]
    puts "          ---------"
    print "          " + board_array[3] + " |"
    print " " + board_array[4] + " |"
    puts " " + board_array[5]
    puts "          ---------"
    print "          " + board_array[6] + " |"
    print " " + board_array[7] + " |"
    puts " " + board_array[8]
  end
end
