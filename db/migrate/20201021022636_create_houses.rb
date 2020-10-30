class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.text       :pr,            null: false
      t.text       :explanation,   null: false
      t.integer    :cat_history_id,   null: false
      t.integer    :chara_stay
      t.integer    :chara_5min
      t.integer    :chara_house
      t.integer    :chara_floor
      t.integer    :chara_weekend
      t.integer    :chara_weekday
      t.integer    :chara_have_cat
      t.integer    :chara_tower
      t.integer    :chara_camera
      t.integer    :stay_price
      t.integer    :one_day_price
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
