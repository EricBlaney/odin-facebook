class LikesController < ApplicationController

    def create
        post = Post.find(params[:post])
        like = post.likes.create(user: current_user)
        redirect_back fallback_location: post
    end

    def destroy
        like = Like.find(params[:id])
        like.destroy
        redirect_back fallback_location: post
    end
end
