class ReviewsController < ApplicationController
  def index
    @reviews = [
      "よきだった！",
      "まあまあだった、、"
    ]
  end
end
