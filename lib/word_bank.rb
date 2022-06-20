class WordBank

	def initialize(word_file)
		@word_file = word_file
		@eligible_words = eligible_words
	end

	def eligible_words
		@eligible_words = []
		File 
			.readlines(@word_file)
			.each do |word|
				eligible_words << word
			end		
	end
	@eligible_words
end