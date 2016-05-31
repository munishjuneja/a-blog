class CommentsController < ApplicationController
	
	def new
		@comment = Comment.new
		@comments = Comment.all
	end

	def create
		@article = Article.find(params[:id])
		@comment = Comment.new(comment_params)
		if logged_in?
			@comment.user_id = current_user.id
			@comment.article_id = @article.id
		end
		
		if @comment.save
			flash[:success]="success"
			redirect_to article_path(@article)
		else
			flash[:danger]="You must log in first"
			redirect_to article_path(@article)
		end

	end

	def destroy
		@comment = Comment.find[:id]
		@comment.destroy
		flash[:danger]="comment delete successfully"
		redirect_to articles_path
	end
	
	private
	def comment_params
		params.require(:comment).permit(:description)
	end
end