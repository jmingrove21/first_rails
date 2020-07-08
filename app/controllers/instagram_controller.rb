class InstagramController < ApplicationController
	def index
		@post=Post.where.not(user_id: current_user.id)
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
end
