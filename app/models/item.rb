class Item < ActiveRecord::Base
  belongs_to :order
  validates :order_id, :name, :price, presence: true
end
