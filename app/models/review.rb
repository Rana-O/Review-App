class Review < ApplicationRecord
  validates :others, {presence: true, length: {maximum: 140}}
end
