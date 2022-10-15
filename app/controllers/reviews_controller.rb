# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = published_reviews
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id unless current_user.id.nil?
    if @review.save
      flash[:notice] = 'Review successfully created. The moderator will check it soon and the review will be published.'
    else
      flash.now[:notice] = 'Please check you form. Review was not sent'
      @reviews = published_reviews
    end
    redirect_to reviews_path
  end

  private

  def published_reviews
    Review.all.where(published: true).order(created_at: :desc)
  end

  def review_params
    params.require(:review).permit(:title, :body, :rating, room: [:name])
  end
end
