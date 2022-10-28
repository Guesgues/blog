class CommentsController < ApplicationController
  before_action :article
  def create
    @comment = article.comments.new(comment_params) do |comment|
      comment.user = current_user
    end
    if @comment.save
      redirect_to article_path(article)
    else 
      redirect_to article_path(article)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to article_path(article)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(article)
   

  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def article
    @article = Article.find(params[:article_id])
  end
end
