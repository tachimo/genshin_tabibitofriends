class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to board_path(@comment.board), notice: "コメントを作成しました。"
    else
      flash.now[:notice] = ("コメント作成に失敗しました。")
      redirect_to board_path(@comment.board)
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    redirect_to board_path(@comment.board), notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
