class ProfilesController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def index
    @user = User.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
  end

  def upvote
  	@user = User.find(params[:id])

  	@user.liked_by current_user
    redirect_to(user_profile_path)
  end

  def downvote
  	@user = User.find(params[:id])

    @user.downvote_from current_user
    redirect_to(user_profile_path)
  end

end
