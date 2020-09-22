class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name,        null: false
      t.string :last_name,         null: false
      t.string :first_name_cana,   null: false
      t.string :last_name_cana,    null: false
      t.string :email,             null: false
      t.date   :birthday,          null: false
      t.string :phone_number,      null: false
      t.integer :gender_id,        null: false
      t.integer :stylist_id,       null: false, foreign_key: true
      t.integer :blood_type_id,    null: false
      t.integer :job_id,           null: false
      t.text :customer_text,       null: false
      t.integer :member_id,        null: false
      t.integer :customer_number,  null: false
      t.timestamps
    end
  end
end
