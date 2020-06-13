class LikeController < ApplicationController
	def check
		like=current_user.likes.find_by(post_id: params[:post_id])
		
		if like.present?
			like.destroy
			#redirect_to post_path(params[:post_id])
		else
			Like.create like_params
			#redirect_to post_path(params[:post_id])

		end
	end
	private
	def like_params
		{user_id: current_user.id, post_id: params[:post_id]}
	end
end
