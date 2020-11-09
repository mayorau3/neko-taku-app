require 'rails_helper'

RSpec.describe Cat, type: :model do
  describe '#create' do
    before do
      @cat = FactoryBot.build(:cat)
    end

    it '全ての入力項目が存在すれば登録できること' do
      expect(@cat).to be_valid
    end

    it '画像が空では登録できないこと' do
      @cat.images = nil
      @cat.valid?
      expect(@cat.errors.full_messages).to include("Images can't be blank")
    end

    it '商品画像の2枚目が空でも登録できること' do
      @cat.images[1] = nil
      expect(@cat).to be_valid
    end

    it '名前が空では登録できないこと' do
      @cat.name = nil
      @cat.valid?
      expect(@cat.errors.full_messages).to include("Name can't be blank")
    end

    it '説明が空では登録できないこと' do
      @cat.explanation = nil
      @cat.valid?
      expect(@cat.errors.full_messages).to include("Explanation can't be blank")
    end

    it '年齢が空では登録できないこと' do
      @cat.age_id = nil
      @cat.valid?
      expect(@cat.errors.full_messages).to include("Age can't be blank")
    end

    it '年齢が「---」では登録できないこと' do
      @cat.age_id = 1
      @cat.valid?
      expect(@cat.errors.full_messages).to include('Age Select')
    end

    it '性別が空(=「---」の時)では登録できないこと' do
      @cat.sex = nil
      @cat.valid?
      expect(@cat.errors.full_messages).to include("Sex can't be blank")
    end

    it '性格の全ての項目が空でも登録できること' do
      @cat.chara_clever = nil
      @cat.chara_sleep = nil
      @cat.chara_active = nil
      @cat.chara_quiet = nil
      @cat.chara_greedy = nil
      @cat.chara_lonely = nil
      @cat.chara_own = nil
      expect(@cat).to be_valid
    end
  end
end
