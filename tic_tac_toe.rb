require_relative 'game'

def play
	puts "WELCOME TO TIC TAC TOE!!!"
	puts ''
	puts "Enter first player's name: "
	first_name = gets.chomp
	first_name = 'Player1' if first_name.empty?
 	puts "Enter second players's name"
	second_name = gets.chomp
	second_name = 'Player2' if second_name.empty?
	players = [Player.new(first_name, 'X'), Player.new(second_name, 'O')]

	game = Game.new(players)
	puts "#{game.current_name} was randomnly selected to start."
	puts "The board is numbered from 1 to #{game.num_of_cells}"

	loop do 
		puts ''
		game.print
		puts ''
		puts "#{game.current_name}, please make a move."
		valid_move = game.get_move
		while valid_move == false
			puts "Invalid move, please try again!"
			valid_move = game.get_move
		end
		puts ''
		break if game.over?
	end
	puts ''
	game.print
	puts ''
	puts "Thanks for playing"
end
play

