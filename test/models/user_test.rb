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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
