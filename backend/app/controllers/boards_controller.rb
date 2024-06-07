class BoardsController < ApplicationController
    def index
        if params[:song_id]
            boards = Board.where(song: params[:song_id])
        else
            boards = Board.all
        end

        if boards.present?
            render json: boards, status: :ok
        else
            render status: :not_found
        end
    end

    def new
        @board = Board.new
    end

    def create
        @board = Board.new(board_params)

        if @board.save
            redirect_to @board, notice: "Board was successfully created."
        else
            render :new
        end
    end

    def destroy
        @board = Board.find(params[:id])
        @board.destroy

        redirect_to boards_url, notice: "Board was successfully destroyed."
    end

    private
        def board_params
            params.require(:board).permit(:song_id, :username, :post)
        end
end
