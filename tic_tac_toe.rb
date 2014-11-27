require_relative 'game'


puts "WELCOME TO TIC TAC TOE!!!"
puts ''
puts "TicTacToe is usually played with 3x3 grid"
puts "Please enter a number N, from 3 to 6, to play a NxN grid"
print "Or press enter to play the default 3x3 game: "
n = gets.chomp
print "Enter first player's name: "
first_name = gets.chomp
first_name = 'Player1' if first_name.empty?
print "Enter second players's name: "
second_name = gets.chomp
second_name = 'Player2' if second_name.empty?
players = [Player.new(first_name, 'X'), Player.new(second_name, 'O')]

game = n.to_i.between?(3, 6) ? Game.new(players, n.to_i) : Game.new(players)

puts "#{game.current_name} was randomnly selected to start."
puts "The board is numbered from 1 to #{game.num_of_cells}"

loop do 
	puts ''
	game.print
	puts ''
	print "#{game.current_name}, please make a move: "
	valid_move = game.get_move
	while valid_move == false
		print "Invalid move, please try again: "
		valid_move = game.get_move
	end
	puts ''
	break if game.over?
end

puts ''
game.print
puts ''
puts "Thanks for playing"
