require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー登録" do
    context "新規登録が上手くいくとき" do
      it "必須項目を全て入力すれば登録出来る" do
        expect(@user).to be_valid
      end
      it "passwordは英字数字混合で６文字以上で登録出来る" do
        @user.password = "123qwe"
        expect(@user).to be_valid
      end
      it "last_name_kanaはカタカナで入力すれば登録出来る" do
        @user.last_name_kana = "アアア"
        expect(@user).to be_valid
      end
      it "first_name_kanaはカタカナで入力すれば登録出来る" do
        @user.first_name_kana = "アアア"
        expect(@user).to be_valid
      end
    end

    

    context "新規登録が上手くいかないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "パスワードが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid")
      end
      it "confirmation_passwordが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid", "Last name kana can't be blank")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid", "First name kana can't be blank")
      end
      it "birthdeyが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "passwordが英字数字混合出ないと登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "last_name_kanaはカタカナでないと登録できない" do
        @user.last_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaはカタカナでないと登録できない" do
        @user.first_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "passwordは6文字以上でないと登録できない" do
        @user.password ="11a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end
end
