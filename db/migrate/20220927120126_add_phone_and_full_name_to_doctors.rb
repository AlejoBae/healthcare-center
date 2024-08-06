class AddPhoneAndFullNameToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :phone, :string
    add_column :doctors, :full_name, :string
  end
end
