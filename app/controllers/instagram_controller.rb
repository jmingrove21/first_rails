class InstagramController < ApplicationController
	def index
		if current_user
			array=Array.new
			current_user.follows.each do |f|
				array.push(f.target_id)
			end
			array.push(current_user.id)
			@post=Post.where(user_id:array)
	
		end
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
		@user=load_user
	end

	def check
		if current_user.present?
			redirect_to destroy_user_session_path, method: delete
		else
			redirect_to new_user_session_path
		end
  end
  

	def check_follow
		follow=current_user.follows.find_by(target_id: params[:id])
		
		if follow.present?
			follow.destroy
		else
			Follow.create follow_params

    end
  end
  
  private
	def follow_params
		{user_id: current_user.id, target_id:  params[:id]}
  end
  
  def load_user
		User.find_by(id: params[:id])
  end
  
end

