class AddDocIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :doc_id, :integer
  end
end
