require 'rails_helper'

RSpec.describe House, type: :model do
  describe '#create' do
    before do
      @house = FactoryBot.build(:house)
    end

    it '全ての入力項目が存在すれば登録できること' do
      expect(@house).to be_valid
    end

    it '画像が空では登録できないこと' do
      @house.images = nil
      @house.valid?
      expect(@house.errors.full_messages).to include("Images can't be blank")
    end

    it '商品画像の2枚目が空でも登録できること' do
      @house.images[1] = nil
      expect(@house).to be_valid
    end

    it 'prが空では登録できないこと' do
      @house.pr = nil
      @house.valid?
      expect(@house.errors.full_messages).to include("Pr can't be blank")
    end

    it '説明が空では登録できないこと' do
      @house.explanation = nil
      @house.valid?
      expect(@house.errors.full_messages).to include("Explanation can't be blank")
    end

    it '猫歴が空では登録できないこと' do
      @house.cat_history_id = nil
      @house.valid?
      expect(@house.errors.full_messages).to include("Cat history can't be blank")
    end

    it '猫歴が「---」では登録できないこと' do
      @house.cat_history_id = 1
      @house.valid?
      expect(@house.errors.full_messages).to include('Cat history Select')
    end

    it '特徴の全ての項目が空でも登録できること' do
      @house.chara_stay = nil
      @house.chara_5min = nil
      @house.chara_house = nil
      @house.chara_floor = nil
      @house.chara_weekend = nil
      @house.chara_weekday = nil
      @house.chara_have_cat = nil
      @house.chara_tower = nil
      @house.chara_camera = nil
      expect(@house).to be_valid
    end

    it '日帰り価格、お泊まり価格が両方とも空では登録できないこと' do
      @house.one_day_price = nil
      @house.stay_price = nil
      @house.valid?
      expect(@house.errors.full_messages).to include("Stay or one day can't be blank")
    end

    it '日帰り価格が空でもお泊まり価格に入力があれば登録できること' do
      @house.one_day_price = nil
      @house.stay_price = '3000'
      expect(@house).to be_valid
    end

    it 'お泊まり価格が空でも日帰り価格に入力があれば登録できること' do
      @house.one_day_price = '400'
      @house.stay_price = nil
      expect(@house).to be_valid
    end

    it '日帰り価格が全角数字だと登録できないこと' do
      @house.one_day_price = '１２３４５'
      @house.valid?
      expect(@house.errors.full_messages).to include("One day price Half-width number")
    end

    it 'お泊まり価格が全角数字だと登録できないこと' do
      @house.stay_price = '１２３４５'
      @house.valid?
      expect(@house.errors.full_messages).to include("Stay price Half-width number")
    end
  end
end
