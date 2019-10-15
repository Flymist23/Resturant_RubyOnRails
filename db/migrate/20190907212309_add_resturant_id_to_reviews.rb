class AddResturantIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :resturant_id, :integer
  end
end
