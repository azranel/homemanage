class CreateApartmentsUsers < ActiveRecord::Migration
  def change
    create_table :apartments_users, :id => false do |t|
      t.references :apartment
      t.references :user
    end
    add_index :apartments_users, [:apartment_id, :user_id]
    add_index :apartments_users, :user_id
  end
end
