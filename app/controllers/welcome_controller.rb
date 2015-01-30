class WelcomeController < ApplicationController
	require "eurovision"
  
  def index
  	result = Eurovision.getAll()
    @songs = Array.new 
    result.each do |song|
      @new_song = Song.new
      @new_song.from_json(song.to_json)     
      @songs << @new_song       
    end
  end
end
