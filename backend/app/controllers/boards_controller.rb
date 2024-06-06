class BoardsController < ApplicationController

    def index
        boards = Board.all.where(params[song: song_id])
        if boards.present?
            render json: boards, status: 200
        else
            render status: 404
        end
    end

    def new
        board = Board.new
    end

    def create
        board = Board.new(board_params)

        if board.save
            redirect_to board, notice: "create"
        else
            render :new
        end
    end

    def destroy
        board.destroy
        if board.save
            redirect_to boards_url, notice: "destroy"
        else
            head :no_content 
        end
    end

    private
        def board_params
            params.require(:board).permit(:song_id, :username, :post)
        end
end
