require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる時' do
      it 'すべての項目を正しく入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '画像がついてなけれ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空で出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it '商品の説明が空で出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end
      it '商品のカテゴリーが空で出品できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end
      it '商品の状態が空で出品できない' do
        @item.item_sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item sales status can't be blank"
      end
      it '配送料の負担が空で出品できない' do
        @item.item_shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item shipping fee status can't be blank"
      end
      it '発送元の地域が空で出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数が空で出品できない' do
        @item.item_scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item scheduled delivery can't be blank"
      end
      it '販売価格が空で出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end
      it '商品価格が¥299以下で出品できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price must be greater than or equal to 300'
      end
      it '商品価格が¥10000000以上で出品できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price must be less than or equal to 9999999'
      end
      it '商品価格が半角数字以外で出品できない' do
        @item.item_price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price is not a number'
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
