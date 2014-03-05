class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :tenant_id, :null => false
      t.string  :email,     :null => false

      t.string :account_type
      t.string :name
      t.string :avatar_url
      t.string :profile_url

      t.timestamps
    end

    add_index :users, [:tenant_id,:email], :unique => true
  end
end
