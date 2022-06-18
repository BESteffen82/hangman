require './colorize'

class Hangman
 include Colorize

	def initialize	
	end

	def print_rules
		puts "\nWelcome to Hangman!"
		puts "Guess the secret word and you'll win the game."
		puts "Type one letter at each turn."
		puts "You are allowed 10 wrong guesses."
		puts "Type 'save' if you would like to save your game."
		puts "Good luck!"
	end

	def start_game
		print_rules
	end
end

new_game = Hangman.new
new_game.start_game


