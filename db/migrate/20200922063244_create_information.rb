class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.date :information_date
      t.text :information_text
      t.integer :user_id,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
