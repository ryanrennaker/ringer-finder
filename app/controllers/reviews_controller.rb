class ReviewsController < ApplicationController

  def create
    review = Review.new
    review.title = params[:title]
    review.body = params[:body]
    review.rating = params[:rating]
    review.item_id = params[:item_id]
    review.user_id = params[:user_id]
    review.save
    redirect_to "/products/#{review.item_id}/show"
  end

end
