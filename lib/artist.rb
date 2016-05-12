require "music_library"

class Artist < MusicLibrary
	attr_accessor :songs

	def initialize name
		super
		@songs = []
	end

end