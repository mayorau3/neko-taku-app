class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string     :name,        null: false
      t.integer    :age,         null: false
      t.integer    :sex,         null: false
      t.integer    :character,   null: false
      t.text       :explanation, null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
