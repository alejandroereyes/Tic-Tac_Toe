class Player
  attr_accessor :name, :token, :moves

  def initialize(name, token)
    @name = name
    @token = token
    @moves = Array.new
  end
end
