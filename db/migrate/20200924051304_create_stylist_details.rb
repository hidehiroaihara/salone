class CreateStylistDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :stylist_details do |t|
      t.string :rank_text,          null: false
      t.integer :stylist_history_id,null: false
      t.integer :nomination,        null: false
      t.integer :nomination_price,  null: false
      t.integer :style_type_id,     null: false
      t.text :style_technique,      null: false
      t.text :hobby,                null: false
      t.integer :stylist_id,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
