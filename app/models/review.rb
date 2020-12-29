# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  others     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_reviews_on_user_id  (user_id)
#
class Review < ApplicationRecord
  validates :others, presence: true, length: {maximum: 140}
  validates :user_id, presence: true

  belongs_to :user
  has_many :likes

  # def user
  #   return User.find_by(id: self.user_id)
  # end


end
