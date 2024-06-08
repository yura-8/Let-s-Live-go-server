require 'utils/apicall'

class Song < ApplicationRecord
    has_many:responses
    has_many:boards

    def self.create_song_data(title, artist)
        apicall = Utils::ApiCall.new
    
        begin
            search_query = "#{title} #{artist}"
            song_id = apicall.search_song_id(search_query)
            lyrics = apicall.get_lyrics(song_id)
            
            song = Song.new(title: title, lyrics: lyrics, songer: artist)
            if song.save
                return true
            else
                Rails.logger.error "Failed to save song: #{song.errors.full_messages.join(", ")}"
                return false
            end
        rescue => e
            Rails.logger.error "Error in create_song_data: #{e.message}"
            return false
        end
    end
    
end
