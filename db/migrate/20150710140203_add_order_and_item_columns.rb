class AddOrderAndItemColumns < ActiveRecord::Migration
  def change
    add_reference :orders, :user, index: true
    add_reference :items, :order, index: true
    
    add_column :items, :name, :string
    add_column :items, :price, :decimal, :precision => 8, :scale => 2
    add_column :orders, :restauration, :string
    add_column :orders, :phone, :string
    add_column :orders, :ordered, :boolean
    add_column :orders, :delivered, :boolean

  end
end
