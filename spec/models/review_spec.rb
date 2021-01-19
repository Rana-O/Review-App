require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validate' do
    context 'othersが' do
      it '空の場合、errors に others を含むこと' do
        r = Review.new(others: nil)
        r.valid?
        expect(r.errors[:others]).not_to be_empty
      end

      it '141文字の場合、errors に others を含むこと' do
        r = Review.new(others: 'a' * 141)
        r.valid?
        expect(r.errors[:others]).not_to be_empty
      end

      it '140文字の場合、errors に others を含まないこと' do
        r = Review.new(others: 'a' * 140)
        r.valid?
        expect(r.errors[:others]).to be_empty
      end
    end

    context 'user_idが' do
      it '空の場合、errors に user_id を含むこと' do
        r = Review.new(user_id: nil)
        r.valid?
        expect(r.errors[:user_id]).not_to be_empty
      end
    end
  end
end
