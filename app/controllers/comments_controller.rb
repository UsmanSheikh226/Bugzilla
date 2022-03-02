class CommentsController < ApplicationController
    def create
        @bug = Bug.find(params[:bug_id])
        @comment = @bug.comments.create(comment_params)
        redirect_to bug_path(@bug)
      end
    
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
    
end
    

