require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups[0..5].each do |cup|
      4.times { cup << :stone }
    end

    @cups[7..12].each do |cup|
      4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 12)
  end

  def make_move(start_pos, current_player_name)
    selected_cup = @cups[start_pos]
    @cups[start_pos] = []
    player_store = current_player_name == @name1 ? 6 : 13
    opp_store = current_player_name == @name1 ? 13 : 6

    cup_idx = start_pos
    until selected_cup.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx == 14
      cups[cup_idx] << selected_cup.shift unless cup_idx == opp_store
    end

    ending_pos = cup_idx

    return :prompt if ending_pos == player_store
    return :switch if @cups[ending_pos].length == 1
    return ending_pos
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length

    @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end
