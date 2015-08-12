=begin
ConnectFour
  initialize
  play
  get_game_mode
  game_mode
  game_over?
  swap_player
  end_game

Board
  initialize
  render
  add_piece
  full?
  victory?
  vertical?
  horizontal?
  diagonal?
  check_diagonal

Player
  initialize
  Human
    get_move
    get_column
  Player
    get_move
    comp_move
    comp_piece
=end

require 'connect_four'

describe Board do

  let(:b){ Board.new }

  describe '#victory' do

    it 'returns true if there is a vertical match' do
      board = [[:-,:x, :x, :x, :x, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-]]

      expect(b.victory?(board)).to eq(true)
    end

    it 'returns false if there is only 3 in a row' do
      board = [[:-,:x, :x, :x, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-]]

      expect(b.victory?(board)).to eq(false)
    end

    it 'returns true if there is a horizontal match' do
      board = [[:-,:x, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-]]

      expect(b.victory?(board)).to eq(true)
    end

    it 'returns false if there is not a horizontal match' do
      board = [[:-,:x, :-, :-, :-, :-], [:-, :o, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-], [:-, :x, :-, :-, :-, :-]]

      expect(b.victory?(board)).to eq(true)
    end

    it 'returns true if there is a diagonal match' do
      board = [[:-, :x, :-, :-, :-, :-], [:-, :-, :x, :-, :-, :-], [:-, :-, :-, :x, :-, :-], [:-, :-, :-, :-, :x, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-]]

      expect(b.victory?(board)).to eq(true)
    end
  end

  describe '#full' do

    it 'returns true if there board is full' do
      b.game_board = [[:o, :x, :o, :o, :x, :x], [:o, :o, :x, :x, :x, :o], [:o, :x, :x, :o, :o, :x], [:x, :o, :o, :x, :x, :o], [:x, :x, :o, :o, :x, :x], [:o, :o, :x, :x, :o, :o], [:x, :x, :x, :o, :o, :o]]

      expect(b.full?).to eq(true)
    end

  end
end

describe Player do

  let(:b){ Board.new }
  let(:p){ Human.new("Player", :x, b) }

  describe '#initialize' do

    it 'raises an ArgumentError with 0 arguments' do
      expect{Player.new}.to raise_error
    end

    it 'does not raise an error when inputing proper arguements' do
      expect{p}.not_to raise_error
    end

    it 'saves your passed in value for @board' do
      expect(p.instance_variable_get(:@board)).to eq(b)
    end

    it 'saves the passed in value for @piece' do
      expect(p.instance_variable_get(:@piece)).to eq(:x)
    end
  end

  describe '#valid_play' do

    it 'tells the user to input a valid column if input is not between 1 and 7' do
      expect(p.valid_play?(9)).to eq(nil)
    end

    it 'returns true if valid column is chosen' do
      expect(p.valid_play?(6)).to eq(true)
    end
  end

end

describe ConnectFour do

  let(:c){ ConnectFour.new }

  describe '#initialize' do

    it 'raises an ArgumentError when passed arguments' do
      expect{ConnectFour.new(1)}.to raise_error
    end

    it 'does not raise an error when passed no arguments' do
      expect{ConnectFour.new}.not_to raise_error
    end

  end

  describe '#game_mode' do

    it 'creates a computer player if user inputs "1"' do
      expect(c.game_mode(1)).to eq(c.player2)
    end

    it 'creates a second human player if user inputs "2"' do 
      expect(c.game_mode(2)).to eq(c.player2)
    end

  end

  describe '#game_over' do

    it 'ends the game if board is full' do
      c.board.game_board = [[:o, :x, :o, :o, :x, :x], [:o, :o, :x, :x, :x, :o], [:o, :x, :x, :o, :o, :x], [:x, :o, :o, :x, :x, :o], [:x, :x, :o, :o, :x, :x], [:o, :o, :x, :x, :o, :o], [:x, :x, :x, :o, :o, :o]]

      expect(c.game_over?).to eq(true)
    end

    it 'ends the game if there is vertical connect four' do
      c.board.game_board = [[:-,:x, :x, :x, :x, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-], [:-, :-, :-, :-, :-, :-]]

      expect(c.game_over?).to eq(true)
    end
      
  end
end