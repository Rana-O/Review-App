class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @like = Like.new(
      user_id: @current_user.id,
      review_id: params[:review_id]
    )
    @like.save
    redirect_to review_path(@like.review_id)
  end

  def destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      review_id: params[:id]
    )
    @like.destroy
    redirect_to review_path(@like.review_id)
  end
end