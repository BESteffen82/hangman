require 'colorize'
require './word_bank'
require 'pry-byebug'

class Hangman 
 include Colorize 

	def initialize
		@guesses_left = 12
		@word_bank = WordBank.new("word_bank.txt")
		@secret_word = @word_bank.secret_word
		@letters_guessed = []	
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
		secret_word_display = Array.new(@secret_word.size, '-' )
		secret_word_display.each do |space| 
			print space.yellow
			print ' '			
		end				
	end

	def game_display
		if @input == '1'
			puts "\nGuesses left: ".green
			puts "Letters you have guessed: \n\n"
			secret_word_display
			puts "\n\nEnter a letter (or 'save' to save the game): "
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


