require_relative 'board'
require_relative 'player'

class Game
	attr_reader :players, :current_player, :other_player, :num_to_coord, :board
	def initialize(players, board = 3)
			@players = players
			@current_player, @other_player = @players.shuffle
			@board = Board.new(board)
			@num_to_coord = Hash[(1..@board.grid.length**2).zip(get_cell_coords)]
	end

	def get_move(number = gets.chomp)
		number = number.to_i
		if valid_move?(number)
			make_move(number)
			return true
		end
			return false
	end

	def print
		@board.show
	end 

	def current_name
		@current_player.name.capitalize
	end

	def current_symbol
		@current_player.symbol
	end

	def num_of_cells
		@board.grid.length**2
	end 

	def over?
		if @board.game_won? 
			puts "#{@other_player.name.capitalize} has won!!!"
			return true
		elsif @board.game_over?
			puts "The game has ended in a tie!!!"
			return true
		end
		false
	end
	
	private
	def make_move(number)
		coord = @num_to_coord[number]
		@board.update_board(coord, @current_player.symbol)
		@current_player, @other_player = @other_player, @current_player
	end

	def valid_move?(num)
		coord = @num_to_coord.fetch(num, nil)
		return false unless coord
		cell = @board.get_cell(coord) 
		cell.empty? ? true : false
	end

	def get_cell_coords
		coords = []
		@board.grid.each_with_index do |row, row_index|
			row.each_with_index{ |col, col_index| coords << [row_index, col_index] }
		end
		return coords
	end

end


