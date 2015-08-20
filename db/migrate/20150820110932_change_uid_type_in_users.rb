class ChangeUidTypeInUsers < ActiveRecord::Migration
  def change
    change_column :users, :uid, :bigint
  end
end
