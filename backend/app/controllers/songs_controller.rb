class SongsController < ApplicationController
    def song_name
        song_name = params[:song_name]
        song = Song.where(title: song_name)
        if song.present?
            render json: song, status: 200
        else
            render status: 404
        end
    end

    def artist_name
        artist_name = params[:artist_name]
        artist = Song.where(songer: artist_name)
        if artist.present?
            render json: artist, status: 200
        else
            render status: 404
        end
    end

    #歌手名と曲名が一致するものを絞って、song_idを返すapi
    def song_id_one
        song_name = params[:song_name]
        artist_name = params[:artist_name]
        songs = Song.where(title: song_name, songer: artist_name)
        if songs.present?
            song_ids = songs.pluck(:song)  # song_idを返す
            render json: song_ids, status: 200
        else
            render status: 404
        end
    end   

    def song_data
        song_name = params[:song_name]
        artist_name = params[:artist_name]
        songs = Song.where(title: song_name, songer: artist_name)
        
        if songs.present?
            render json: { message: 'Song already exists' }, status: 200
        else
            flag = Song.create_song_data(song_name, artist_name)
            if flag.present?
                render json: { message: 'Song created successfully' }, status: 200
            else
                render json: { error: 'Failed to create song' }, status: 404
            end
        end
    end
    
end
