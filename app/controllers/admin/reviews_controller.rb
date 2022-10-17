module Admin
  class ReviewsController < ApplicationController
    before_action :admin_review, only: %i[show update destroy]

    def index
      @admin_reviews = Admin::Review.all.where(published: false).order(created_at: :desc)
      authorize @admin_reviews
    end

    def update
      flash[:notice] = if @admin_review.update(published: true)
                         'The review was published'
                       else
                         'The review can not be approved'
                       end
      redirect_to admin_reviews_path
    end

    def destroy
      @admin_review.destroy
      flash[:notice] = 'The review was destroyed'
      redirect_to admin_reviews_url
    end

    private

    def admin_review
      @admin_review = Admin::Review.find(params[:id])
      authorize @admin_review
    end
  end
end
