class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    user_ids = current_user.timeline_user_ids
    @posts = Post.where(user_id: user_ids).order("created_at DESC")
    # @posts = Post.all
  end

  def show
    @post = Post.find (params[:id])
    @can_moderate = (current_user == @post.user)
  end


end
