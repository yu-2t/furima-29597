require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/flag.png')
  end

  describe "商品登録" do
    context "商品登録が出来る" do
      it "必須項目を全て入力すれば商品登録が出来る" do
        expect(@item).to be_valid
      end
      it "priceが数字なら登録出来る" do
        @item.price = 600
        expect(@item).to be_valid
      end
      it "category_idが１以外なら登録できる" do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it "condition_idが１以外なら登録できる" do
        @item.condition_id = 2
        expect(@item).to be_valid
      end
      it "fee_idが１以外なら登録できる" do
        @item.fee_id = 2
        expect(@item).to be_valid
      end
      it "prefectures_idが１以外なら登録できる" do
        @item.prefectures_id = 2
        expect(@item).to be_valid
      end
      it "schedule_idが１以外なら登録できる" do
        @item.schedule_id = 2
        expect(@item).to be_valid
      end
    end

    context "商品の登録が出来ない" do
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空だと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが数字でないと登録できない" do
        @item.price = "ああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300以下だと登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "priceが999999より大きいと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it "category_idが１だと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idが１だと登録できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "fee_idが1だと登録できない" do
        @item.fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end
      it "prefectures_idが1だと登録できない" do
        @item.prefectures_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "schedule_idが1だと登録できない" do
        @item.schedule_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule must be other than 1")
      end
    end
  end
end
