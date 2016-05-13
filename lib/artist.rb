require "music_library"

class Artist < MusicLibrary
	attr_reader :songs

	def initialize name
		super
		@songs = []
	end

	def add_song song
		add_artist_to_song(song) if song.artist.nil?

		@songs << song unless @songs.include?(song)
	end

	def add_artist_to_song song
		song.artist = self
	end



end