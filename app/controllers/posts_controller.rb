class PostsController < ApplicationController

    def index
        @friends = current_user.friends.all
        @friends_list = @friends.limit(5)
        @posts= Post.where(user_id: current_user.friends).or(Post.where(user_id: current_user)).order(created_at: :desc).limit(10)
    end


    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to action: "index"
        else
            render :new
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to action: "index"
    end


    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to action: "index"
    end

    private

    def post_params
        params.require(:post).permit(:body)
    end

end
