class ResponseController < ApplicationController

    def index
        @responses = @song.responses
        render json: @responses
    end

    def create
        @response=@song.responses.build(response_params)
        @response.user=current_user

        if @response.save
            render json: @response, status: :created
        else
            render json: @response.errors, status: :unprocessable_entity
        end
    end
    def show
        @response=@song.response.find_by(id: params[:id])
        if @response.present?
            render json: @response, status: :200
        else
            render status: :404
        end
    end

    def update
        if @response.update(response_params)
            render json: @response
        else
            render json: @response.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @response.destroy
        head :no_content
    end
    
    
    def set_song
        @song = Song.find(params[:song_id])
        render(status: :404)unless @song
    end
    def set_response
        @response=@song.responses.find(params[:id])
    end
    
    def response_params
        params.require(:response).permit(:content, :user_id)
    end  
end
