class AddPublishedColumnToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :published, :boolean, default: false
  end
end
