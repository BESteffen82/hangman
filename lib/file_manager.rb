module FileManager

	def initialize
		@save_name = save_name
		load_game
	end

	def load_game
	end

	def save_game
		puts "Enter a name for your saved game:"
		@save_name = gets.downcase.chomp
	end
end