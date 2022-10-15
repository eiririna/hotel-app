module Admin
  class ReviewsController < ApplicationController
    before_action :set_admin_review, only: %i[show update destroy]

    def index
      @admin_reviews = Admin::Review.all.where(published: false).order(created_at: :desc)
      authorize @admin_reviews
    end

    private

    def admin_review
      @admin_review = Admin::Review.find(params[:id])
      authorize @admin_review
    end
  end
end