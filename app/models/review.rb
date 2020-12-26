class Review < ApplicationRecord
  validates :others, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
end
