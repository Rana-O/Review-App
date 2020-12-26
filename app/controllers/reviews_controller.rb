class ReviewsController < ApplicationController
  before_action :authenticate_user
  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def show
    @review = Review.find(params[:id])
    @user = User.find(@review.user_id)
  end

  def new
      @review = Review.new
  end

  def create
    @review = Review.new(
      others: params[:others],
      user_id: @current_user.id
    )
    if @review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to(reviews_path)
    else
      render(:new)
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.others = params[:others]
    if @review.save
      flash[:notice] = "レビューを編集しました"
      redirect_to(reviews_path)
    else
      render(:edit)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "レビューを削除しました"
    redirect_to(reviews_path)
  end
end
