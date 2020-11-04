class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string     :name,        null: false
      t.integer    :age_id,      null: false
      t.integer    :sex,         null: false
      t.integer    :chara_clever
      t.integer    :chara_sleep
      t.integer    :chara_active
      t.integer    :chara_quiet
      t.integer    :chara_greedy
      t.integer    :chara_lonely
      t.integer    :chara_own
      t.text       :explanation, null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
