class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :string
    add_column :users, :name, :string
    User.create! do |u|
        u.email     = 'admin@admin.com'
        u.password    = 'password'
        u.name = 'Admin User'
        u.role = 'admin'
    end

  end
end
