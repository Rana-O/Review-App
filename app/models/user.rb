# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  password   :string
#
class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100}
  validates :email, presence: true, uniqueness: true, length: { maximum: 255}
  validates :password, presence: true

  has_many :reviews
end
