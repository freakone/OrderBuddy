class AddUserFields < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :name, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires, :string
    add_column :users, :uid, :integer
  end
end
