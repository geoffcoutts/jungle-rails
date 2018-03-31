class ReviewsController < ApplicationController

  # before_filter :authorize

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]

    @review.save

    redirect_to product_path(params[:product_id])
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
