class AddPhoneToVets < ActiveRecord::Migration
  def change
    add_column :vets, :phone, :string, null: false
  end
end
