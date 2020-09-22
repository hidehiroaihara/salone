class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.boolean :consent
      t.integer :user_id,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
