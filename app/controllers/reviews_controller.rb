class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def new
  end

  def create
    @review = Review.new(others: params[:others])
    @review.save
    redirect_to(reviews_path)
  end

  def edit
  end
end
