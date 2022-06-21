module FileManager

	def initialize
		@game_details = []
		@save_name = save_name
		load_game
	end

	def load_game		
	end

	def save_game
		puts "Enter a name for your saved game:"
		@save_name = gets.downcase.chomp
		File.open("../saved_games/#{@save_name}.yml", "w")
	end
end