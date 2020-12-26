# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(100)      not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  password   :string
#
class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 0, maximum: 100 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :password, {presence: true}
end
