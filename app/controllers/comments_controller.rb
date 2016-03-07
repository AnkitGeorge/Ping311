class CommentsController < ApplicationController
 before_filter :require_login, except: [:index, :show]
 before_filter :load_report #check this method

 def show
   @comment = Comment.find(params[:id])
 end

 def create
   @comment = @report.comments.build(comment_params)
   @comment.user = current_user

   if @comment.save
     redirect_to report_url(@report), notice: 'Your comment has been posted.'
     #test to see what happens when @comment.report in brackets is removed.
   else
     redirect_to report_url(@report), notice: 'Your comment was not saved. Please try again.'
   end

 end

 def destroy
   @comment = Comment.find(params[:id])

   if @comment.present?
     @comment.destroy
   end

   redirect_to reports_url, notice: 'Your comment has been deleted.'
 end

 private
 def comment_params
   params.require(:comment).permit(:body_text, :user_id, :comment_id, :report_id)
 end

 def load_report
   @report = Report.find(params[:report_id])
 end

end
