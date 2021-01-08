require 'rails_helper'

RSpec.describe BuyDestination, type: :model do
  before do
    @buy_destination = FactoryBot.build(:buy_destination)
  end

  describe "購入機能" do
    context "購入が出来る" do
      it "全てが正しく入力されていれば登録出来る" do
        expect(@buy_destination).to be_valid
      end
      it "buildingは空でも登録出来る" do
        @buy_destination.building = ""
        expect(@buy_destination).to be_valid
      end
      it "cordは{3}-{4}で正しく購入出来る" do
        @buy_destination.cord = "123-1234"
        expect(@buy_destination).to be_valid
      end
      it "telは10桁で登録出来る" do
        @buy_destination.tel = "0901234123"
        expect(@buy_destination).to be_valid
      end
      it "telは11桁で登録出来る" do
        @buy_destination.tel = "09012341234"
        expect(@buy_destination).to be_valid
      end
    end

    context "購入できない" do
      it "cordが空だと購入できない" do
        @buy_destination.cord = ""
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Cord can't be blank", "Cord is invalid")
      end
      it "cordはハイフンがないと購入できない" do
        @buy_destination.cord = "1234567"
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Cord is invalid")
      end
      it "cordは前半が3桁でないと購入できない" do
        @buy_destination.cord = "12-4567"
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Cord is invalid")
      end
      it "cordは後半が4桁でないと購入できない" do
        @buy_destination.cord = "123-567"
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Cord is invalid")
      end
      it "prefecture_idが１だと購入できない" do
        @buy_destination.prefecture_id = 1
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "address1が空だと購入できない" do
        @buy_destination.address1 = ""
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Address1 can't be blank")
      end
      it "address2が空だと登録できない" do
        @buy_destination.address2 = ""
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Address2 can't be blank")
      end
      it "telが10桁未満だと購入できない" do
        @buy_destination.tel = "090123456"
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Tel is invalid")
      end
      it "telが空だと購入できない" do
        @buy_destination.tel = ""
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Tel can't be blank", "Tel is invalid")
      end
      it "tokenが空だと登録できない" do
        @buy_destination.token = ""
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Token can't be blank")
      end
      it "priceが空だと登録できない" do
        @buy_destination.price = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Price can't be blank")
      end
      
    end
  end
end
