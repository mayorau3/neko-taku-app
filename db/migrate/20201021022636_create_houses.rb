class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.text       :pr,            null: false
      t.text       :explanation
      t.integer    :cat_history_id,   null: false
      t.integer    :character
      t.integer    :stay_price
      t.integer    :one_day_price
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
