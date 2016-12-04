class Board
	attr_accessor :grid

	def initialize
		@grid = Array.new(9, '-')
	end

	def display_grid
		puts "\n"
      @grid.each_slice(3) { |row| puts row.join(' | ') }
		puts "\n"
	end
end