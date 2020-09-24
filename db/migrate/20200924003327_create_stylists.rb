class CreateStylists < ActiveRecord::Migration[6.0]
  def change
    create_table :stylists do |t|
      t.string :stylist_name,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
