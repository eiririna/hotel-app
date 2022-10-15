class RemoveReviewableFromTableReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :reviewable_id, :bigint
    remove_column :reviews, :reviewable_type, :string
  end
end
