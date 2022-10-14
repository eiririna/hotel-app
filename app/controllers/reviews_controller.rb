# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @reviews = all_published_reviews
  end

  def create
    @review = Review.new(review_params)
  end

  private

  def all_published_reviews
    Review.all.order(created_at: :desc)
  end

  def review_params
    params.require(:review).permit(:name, :email, :review)
  end
end
