class PostsController < ApplicationController
    #CRUD 7가지. index, new, show, edit, create, update, delete
    def index
    end

    def new
    end

    def show
    end

    def edit
    end

    def create
        post=Post.create params.require(:post).permit(:title,:body,:author)
        redirect_to post_path(post)
    end

    def update
    end
    
    def delete
    end

   
    private
    def post_params
        # 가장 마지막 줄을 return 한다. -> return 생략 가능.
        return params.require(:post).permit(:title,:body)
    end
end
