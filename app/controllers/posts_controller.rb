class PostsController < ApplicationController
    before_action :load_object, only: %i(show edit update destroy)
    before_action :check_user, only: %i(edit destroy update)
    #CRUD 7가지. index, new, show, edit, create, update, destroy
    def index
        @posts=Post.all
        #모든 게시물들을 다 가지고 온다.
    end

    def new

    end

    def show
       
    end

    def edit
       
    end

    def create
       # post=Post.create params.require(:post).permit(:title,:body,:author)
       post=Post.create post_params 
       redirect_to post_path(post)
    end

    def update
        
        #post.update params.require(:post).permit(:title, :author, :body)
        @post.update post_params
        redirect_to post_path(post)
    end
    
    def destroy
       @post.destroy
       redirect_to posts_path()
    end

    def my
        @mypost=current_user.posts.all
    end
   
    private
    def post_params
        # 가장 마지막 줄을 return 한다. -> return 생략 가능.
        return params.require(:post).permit(:title,:author, :body, :user_id)
    end

    def load_object
        @post=Post.find_by(id: params[:id])
    end


    def check_user
        redirect_to root_path if current_user != @post.user
    end
end
