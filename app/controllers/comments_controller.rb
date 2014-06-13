class CommentsController < ApplicationController
  before_action :require_user
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = 'Your comment was created.'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end

  def vote
    @comment = Comment.find(params[:id])
    @vote = Vote.create(vote: params[:vote], voteable: @comment, user_id: current_user.id)
    if @vote.valid?
      flash[:notice] = 'Your vote was counted.'
    else
      flash[:error] = 'Your vote was not counted.'
    end
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end