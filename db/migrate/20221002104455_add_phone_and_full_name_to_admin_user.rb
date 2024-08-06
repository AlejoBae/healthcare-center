class AddPhoneAndFullNameToAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :phone, :string
    add_column :admin_users, :full_name, :string
  end
end
