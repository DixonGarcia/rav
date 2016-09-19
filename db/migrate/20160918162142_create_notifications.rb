class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :email
      t.boolean :status

      t.timestamps
    end
  end
end