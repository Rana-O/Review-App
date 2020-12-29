# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  review_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_likes_on_review_id  (review_id)
#  index_likes_on_user_id    (user_id)
#
class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :review_id, presence: true

  belongs_to :user
  belongs_to :review
end
