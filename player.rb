class Player
	attr_accessor :name, :mark, :bot

	def initialize(mark = "X", bot = false, name = nil)
		@name = name
		@mark = mark
		@bot = bot
	end

	def choose_name
		puts "What's your name?"
		@name = gets.chomp.to_s
		puts "Welcome #{@name}, I'm Minus. Let's play..."
	end
end