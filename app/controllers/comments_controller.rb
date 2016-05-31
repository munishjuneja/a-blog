class CommentsController < ApplicationController
	
	def new
	end

	def create
		@article = Article.find(params[:id])
		@comment = Comment.new(comment_params)
		if logged_in?
			@comment.user_id = current_user.id
			@comment.article_id = @article.id
		end
		
		if @comment.save
			redirect_to article_path(@article)
		else
			flash[:danger]="You must log in first"
			redirect_to article_path(@article)
		end

	end

	private
	def comment_params
		params.require(:comment).permit(:description)
	end
end