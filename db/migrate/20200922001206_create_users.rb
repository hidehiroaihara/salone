class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name        
      t.string :last_name
      t.string :first_name_cana
      t.string :last_name_cana
      t.string :email
      t.date   :birthday
      t.string :phone_number
      t.integer :gender_id        
      t.integer :stylist_id,       foreign_key: true
      t.integer :blood_type_id
      t.integer :job_id
      t.text :customer_text
      t.integer :member_id
      t.integer :customer_number
      t.integer :age_id
      t.timestamps
    end
  end
end
