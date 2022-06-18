module Colorize
	def colorize(color_code)
		"\e[#{color_code}m#{self}\e[0m"
	end

	def red
		colorize(91)
	end
	
	def blue
		colorize(96)
	end

	def yellow
		colorize(93)
	end

	def purple
		colorize(95)
	end

	def green
		colorize(92)
	end
end

