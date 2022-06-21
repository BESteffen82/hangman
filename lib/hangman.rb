require 'colorize'
require './word_bank'
require './file_manager'
require 'yaml'
require 'pry-byebug'

class Hangman 
 include Colorize
 include FileManager 

	def initialize
		@guesses_left = 12
		@word_bank = WordBank.new("word_bank.txt")
		@secret_word = @word_bank.secret_word.chomp
		@letters_guessed = []
		@secret_word_display = ('_ ' * @secret_word.size)	
	end

	def print_rules
		puts "\nWelcome to Hangman!"
		puts "Guess the secret word and you'll win the game."
		puts "Type one letter at each turn."
		puts "You are allowed 10 wrong guesses."
		puts "Type 'save' if you would like to save your game."
		puts "Good luck!"
	end

	def user_input
		loop do
			puts "\nEnter '1' to start a new game".blue		
			puts "Enter '2' to load a saved game".blue
			@input = gets.chomp
			return @input if @input == '1' || @input == '2'
			puts "\nInvalid answer"
		end		
	end

	def secret_word_display					
		puts "#{@secret_word_display.to_s}".yellow										 				
	end

	def guess_letter
		@guess = gets.chomp.downcase
		save_game if @guess == 'save'		
		if @letters_guessed.include?(@guess)			 
			puts "\nLetter has already been chosen. Guess again".red		
		elsif ('a'..'z').include?(@guess) 
			@letters_guessed << @guess
			@guesses_left -= 1		
		else puts "\nInvalid guess".red	
		end										  			
	end

	def check_winner_loser
		if @guesses_left == 0
			puts "\n\nYou lost! The secret word was '#{@secret_word}'!".red
			play_again						
		elsif !@secret_word_display.include?('_')		
			puts "\n\nYou guessed the secret word '#{@secret_word}'! You win!".yellow
			play_again
		end			 
	end

	def update_word_display					
		@secret_word.split(//).each_with_index do |letter, index|
			if @secret_word[index] == @guess
				@secret_word_display[index * 2] = @secret_word[index]																				
			end		
		end							
	end

	def play_again
		puts "\nPlay again?(Y/N)"
		@play_again_answer = gets.chomp.downcase
		case @play_again_answer
		when 'y'
			initialize
			start
		when 'n'
			puts "\nThanks for playing!".red
			exit
		else puts "Invalid response"
			play_again
		end
	end	

	def game_display
		if @input == '1'
			loop do
				puts "\nGuesses left: #{@guesses_left}".green			 			
				puts "Letters you have guessed: #{@letters_guessed.join(' ')}\n\n"											
				secret_word_display														
				print "\n\nEnter a letter (or 'save' to save the game): "
				check_winner_loser	
				guess_letter
				update_word_display											
				p @secret_word												
			end
		end				
	end

	def start
		print_rules
		user_input
		game_display			
	end
end

new_game = Hangman.new
new_game.start


