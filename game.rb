require './board.rb'
require './player.rb'

class Game
	attr_accessor :player1, :player2, :board

	@@combinations = [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], 
			 						  [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

	def initialize
		@board 		= Board.new
		@player1 	= Player.new
		@player2 	= Player.new("O", true, "Minus")
		@current_player = @player1
		@next_player 		= @player2
	end

	def start
		@player1.choose_name
		@board.display_grid
		turn until @winner
	end

	def choose_location
		if @current_player.bot
			@location = rand(0..8)
		else
			puts "Where do you want to play?"
			@location = gets.chomp.to_i - 1
		end
	end

	def empty?
		@board.grid[@location].include?('-')
	end

	def grid_update
		@board.grid[@location] = @current_player.mark
		@board.display_grid
	end

	def turn
		choose_location
		if empty?
			grid_update
			win?(@current_player)
		else
			puts "This space is already taken!" unless @current_player.bot
			turn
		end
		switch_players
	end

	def switch_players
		@current_player, @next_player = @next_player, @current_player
	end

	def win?(current_player)
		@@combinations.each do |combination|
		  if combination.all? { |n| @board.grid[n] == @current_player.mark }
		  	@winner = current_player 
		  end
		end
		if @winner 
			puts "#{@current_player.name} won!"
		else
			puts "#{@current_player.name} played"
			puts "=============================="
			puts "\n"
		end
	end
end

game = Game.new
game.start