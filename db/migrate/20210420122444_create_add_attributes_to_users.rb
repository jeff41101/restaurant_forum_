class CreateAddAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :add_attributes_to_users do |t|
      add_column :users, :name, :string
      add_column :users, :intro, :text
      add_column :users, :avatar, :string
      t.timestamps
    end
  end
end
