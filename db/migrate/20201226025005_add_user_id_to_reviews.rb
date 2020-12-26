class AddUserIdToReviews < ActiveRecord::Migration[5.2]
  def change
    # add_column :reviews, :user_id, :integer
    add_reference :reviews, :user, foreign_key: true
  end
end
