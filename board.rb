# testing c9.io push

class Board 
	attr_reader :grid
	def initialize(n = 3)
		@grid = Array.new(n) { Array.new(n) {''}}
	end

	def show
		grid.each_with_index do |row, row_index|
			row.each_with_index do |cell, col_index|
				if cell.empty?
					print row_index < grid.length-1 ? '_' : ' '
				else 
					print cell
				end
				print '|' if col_index < grid.length-1
			end
			puts ''
		end
	end

	def game_over?
		grid.each do |row|
			row.each { |cell| return false if cell.empty? }
		end
		true
	end

	def game_won?
		winning_arrays.each do |array|
			return true if same?(array)
		end
		false
	end

	def get_cell(coord)
		grid[coord[0]][coord[1]]
	end
	
	def update_board(coord, symbol)
		row = coord[0]
		col = coord[1]
		@grid[row][col] = symbol
	end

	private
	def winning_arrays
		arrays = 	grid + grid.transpose 
		arrays << (0..grid.length-1).map{ |i| grid[i][i]} 
		arrays << (0..grid.length-1).to_a.zip((0..grid.length-1).to_a.reverse).map{ |i, j| grid[i][j]}
		return arrays
	end

	def same?(array)
		array.all? {|element| element == array[0]  && !element.empty?}
	end

end


