class ReviewsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end

  def new
      @review = Review.new
  end

  def create
    @review = Review.new(create_params)
    @review.user_id = @current_user.id
    if @review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to reviews_path
    else
      render :new
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
      redirect_to reviews_path
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "レビューを削除しました"
    redirect_to reviews_path
  end

  def ensure_correct_user
    @review = Review.find(params[:id])
    if @review.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to reviews_path
    end
  end

  private
  def create_params
    params
      .require(:review)
      .permit(
        :others
      )
  end
end
