module FileManager

	def initialize
		@game_details = []
		@save_name = save_name						
	end

	def load_game
		load_game_choice
		@loaded_game = YAML.load_file("../saved_games/#{@game_files[@game_choice - 1]}")
		@guesses_left = @loaded_game[0]
		@secret_word = @loaded_game[1]
		@letters_guessed = @loaded_game[2]
		@secret_word_display = @loaded_game[3]
		game_display		
	end

	def load_game_choice
		puts "Choose the number of a game to load:"		
		@game_files = Dir.entries("../saved_games").drop(2)
		@game_list = @game_files.map.with_index do|file, index|
			"#{index + 1}. #{file.delete('.yml')}"							
		end
		@game_list.each{|game| puts game}				
		@game_choice = gets.chomp.to_i			
	end

	def save_game
		puts "Enter a name for your saved game:"
		@save_name = gets.downcase.chomp
		@game_details = [
			@guesses_left,
			@secret_word,
			@letters_guessed,
			@secret_word_display,
		]
		File.open("../saved_games/#{@save_name}.yml", "w") do |file|
			file.write(@game_details.to_yaml)
		puts "Your game has been saved.".yellow
		exit	
		end
	end
end

