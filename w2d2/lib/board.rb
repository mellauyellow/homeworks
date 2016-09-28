require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @name1, @name2 = name1, name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      cup.push(:stone, :stone, :stone, :stone)
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, @cups.length)
  end

  def make_move(start_pos, current_player_name)
    temp = @cups[start_pos]
    @cups[start_pos] = []

    start = start_pos
    until temp.empty?
      start += 1
      start = 0 if start == 14
      unless (start == 6 && current_player_name == @name2) || (start == 13 && current_player_name == @name1)
        @cups[start] << temp.shift
      end
    end

    return :prompt if (start == 6 && current_player_name == @name1) || (start == 13 && current_player_name == @name2)
    return :switch if @cups[start].length == 1
    return start if @cups[start].length > 1
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
    return true if @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end
