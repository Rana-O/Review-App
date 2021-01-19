require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validate' do
    context 'user_id' do
      it '空の場合、errors に user_id を含むこと' do
        l = Like.new(user_id: nil)
        l.valid?
        expect(l.errors[:user_id]).not_to be_empty
      end
    end

    context 'review_id' do
      it '空の場合、errors に review_id を含むこと' do
        l = Like.new(review_id: nil)
        l.valid?
        expect(l.errors[:review_id]).not_to be_empty
      end
    end
  end
end
