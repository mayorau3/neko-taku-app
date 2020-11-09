require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe '#create' do
    before do
      @reservation = FactoryBot.build(:reservation)
    end

    it '全ての入力項目が存在すれば登録できること' do
      expect(@reservation).to be_valid
    end

    it 'お預け日が空では登録できないこと' do
      @reservation.start_date = nil
      @reservation.valid?
      expect(@reservation.errors.full_messages).to include("Start date can't be blank")
    end

    it '日帰り滞在時間、お泊まり日数が両方とも空では登録できないこと' do
      @reservation.one_day_hours = nil
      @reservation.stay_days = nil
      @reservation.valid?
      expect(@reservation.errors.full_messages).to include("Either stay or one day / Only one of them")
    end

    it '日帰り滞在時間、お泊まり日数が両方とも入力があると登録できないこと' do
      @reservation.one_day_hours = '2'
      @reservation.stay_days = '3'
      @reservation.valid?
      expect(@reservation.errors.full_messages).to include("Either stay or one day / Only one of them")
    end

    it '日帰り滞在時間が空でもお泊まり日数に入力があれば登録できること' do
      @reservation.one_day_hours = nil
      @reservation.stay_days = '4'
      expect(@reservation).to be_valid
    end

    it 'お泊まり日数が空でも日帰り滞在時間に入力があれば登録できること' do
      @reservation.one_day_hours = '5'
      @reservation.stay_days = nil
      expect(@reservation).to be_valid
    end

    it 'メッセージが空では登録できないこと' do
      @reservation.message = nil
      @reservation.valid?
      expect(@reservation.errors.full_messages).to include("Message can't be blank")
    end

  end
end
