class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.string :abbreviation, null: false, index: true

      t.timestamps null: false
    end
  end
end
