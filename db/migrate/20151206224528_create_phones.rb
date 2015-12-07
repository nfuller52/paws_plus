class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number, null: false
      t.integer :phone_type, null: false, default: 0

      t.timestamps null: false
    end
  end
end
