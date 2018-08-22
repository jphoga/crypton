class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    authorize @comment
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'posts/show' }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
