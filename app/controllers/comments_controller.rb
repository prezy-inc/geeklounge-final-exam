class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @comment = current_user.comments.build(comment_params)
    
    if @comment.save
      flash[:success] = 'コメントが完了しました！'
      redirect_to micropost_path(@comment.micropost), status: :see_other
    else
      @micropost = @comment.micropost
      @comments = @micropost.comments
      render 'microposts/show', status: :unprocessable_entity
    end
  end
  
  def destroy
    @comment.destroy
    flash[:success] = "コメントが削除されました"
    redirect_to @comment.micropost, status: :see_other
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :micropost_id)
    end
    
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to(root_url, status: :see_other) if @comment.nil?
    end
end