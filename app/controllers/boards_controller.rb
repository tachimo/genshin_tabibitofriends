class BoardsController < ApplicationController
  def index
    @search = Board.ransack(params[:q])
    @boards = @search.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(20)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save!
      redirect_to boards_path(@board), notice: "募集「#{@board.title}」を作成しました。"
    else
      render :new
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user) #, order(created_at: :desc)
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board), notice: "募集内容「#{@board.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy
    redirect_to boards_path, notice: "募集内容「#{@board.title}」を削除しました。"
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :user_id)
  end
end
