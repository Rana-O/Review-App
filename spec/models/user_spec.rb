require 'rails_helper'

# つぎやること。
# 1. let で事前定義する、必要な定義だけ書き換える
# 2. FactoryBot を導入して、let を置き換える
# 3. 現状の validates の実装をもちょっと増やしてみる（できれば）
# 4. 3 の追加した validates に対してテスト増やす

RSpec.describe User, type: :model do
  describe 'validate' do
    let(:user) { User.new(name: name, email: email, password: password) }
    let(:name) { 'hoge' }
    let(:email) { 'hoge@example.com' }
    let(:password) { 'hogehoge' }

    context 'name が' do
      context '空の場合' do
        let(:name) { nil }

        it 'errors に name を含むこと' do
          user.valid?
          expect(user.errors[:name]).not_to be_empty
        end
      end

      context '101文字の場合' do
        let (:name) { 'a'*101 }

        it 'errors に name を含むこと' do
          user.valid?
          expect(user.errors[:name]).not_to be_empty
        end
      end

      context '100文字の場合' do
        let (:name) { 'a'*100 }

        it 'errors に name を含まないこと' do
          user.valid?
          expect(user.errors[:name]).to be_empty
        end
      end
    end

    context 'emailが' do
      context '空の場合' do
        let (:email) { nil }

        it 'errors に email を含むこと' do
          user.valid?
          expect(user.errors[:email]).not_to be_empty
        end
      end

      context '256文字の場合' do
        let (:email) { 'a'*256 }

        it 'errors に email を含むこと' do
          expect(user.valid?).to be_falsey
          expect(user.errors[:email]).not_to be_empty
        end
      end

      context '255文字の場合' do
        let (:email) {'a'*255 }

        it 'errors に email を含まないこと' do
          user.valid?
          expect(user.errors[:email]).to be_empty
        end
      end

      context '既にあるレコードと重複してる場合' do
        before { user.save }

        it 'errors に email を含むこと' do
          u2 = user.dup
          u2.valid?
          expect(u2.errors[:email]).not_to be_empty
        end
      end
    end
  end
end
