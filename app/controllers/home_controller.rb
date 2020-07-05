class HomeController < ApplicationController
    def index
      @posts=Post.all
      if current_user
        @user=current_user
        @favorate_posts=Post.where
      else
        @user="게스트"
      end
    end
end
