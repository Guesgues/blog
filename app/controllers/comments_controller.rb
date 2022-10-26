class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.edit(comment_params)
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      redirect_to article_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
