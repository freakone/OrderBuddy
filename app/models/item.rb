class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  validates :order_id, :name, :price, presence: true
end
