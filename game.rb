require_relative 'board'
require_relative 'player'

class Game
	#attr_accessor :players, :current_player, :other_player, :mapping, :board
	def initialize(players, board = 3)
			@players = players
			@current_player, @other_player = @players.shuffle
			@board = Board.new(board)
			@mapping = Hash[(1..@board.grid.length**2).zip(get_cell_coords)]
	end

	def get_move(number = gets.chomp)
		number = number.to_i
		if valid_move?(number)
			make_move(number)
			return true
		else 
			return false
		end
	end

	def print
		@board.show
	end 

	def current_name
		@current_player.name.capitalize
	end

	def current_color
		@current_player.color
	end

	def num_of_cells
		@board.grid.length**2
	end 

	def over?
		if @board.game_won? == true
			puts "#{@other_player.name.capitalize} has won!!!"
			return true
		elsif @board.game_over? == true
			puts "The game has ended in a tie!!!"
			return true
		end
	end
	
	private
	def make_move(number)
		coord = @mapping[number]
		@board.update_board(coord, @current_player.color)
		@current_player, @other_player = @other_player, @current_player
	end

	def valid_move?(num)
		coord = @mapping.fetch(num, nil)
		return false unless coord
		cell = @board.get_cell(coord) 
		if cell.empty?
			return true
		else
			return false
		end
	end

	def get_cell_coords
		coords = []
		@board.grid.each_with_index do |row, row_index|
			row.each_with_index do |cell, col_index|
				coords << [row_index, col_index]
			end
		end
		coords
	end
end

