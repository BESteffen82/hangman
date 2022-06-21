class WordBank
	def initialize(word_file)
		@word_file = word_file
		@eligible_words = eligible_words
	end

	def secret_word
		@eligible_words.sample		
	end

	def eligible_words
		@eligible_words = []
		File 
			.readlines(@word_file)
			.each do |word|
				word.gsub!(/\r\n?/, '')
				@eligible_words << word if word.size >= 5 && word.size <= 12 				
			end
		@eligible_words		
	end	
end