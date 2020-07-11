class InstagramController < ApplicationController
	def index
		@post=Post.where(user_id: [current_user.follows])
	end

	def new
	
	end

	def create
	
	end

	def update
	
	end
	
	def destroy
	
	end
	
	def edit
	
	end

	def show
	
	end

	def check
		if current_user.present?
			redirect_to destroy_user_session_path, method: delete
		else
			redirect_to new_user_session_path
		end
    end
end
