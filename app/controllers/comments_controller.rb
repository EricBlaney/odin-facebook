class CommentsController < ApplicationController

    def create
        post = Post.find(params[:comment][:post_id])
        comment = post.comments.build(user: current_user, body: params[:comment][:body])
        if comment.save
            redirect_to request.referrer
        else
            flash[:notice] = 'We could not save your comment.  Please try again.'
            redirect_to request.referrer
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to request.referrer
    end
end
