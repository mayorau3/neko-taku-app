class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date       :start_date,   null: false
      t.integer    :stay_days
      t.integer    :one_day_hours
      t.text       :message,      null: false
      t.references :user,         null: false, foreign_key: true
      t.references :house,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
