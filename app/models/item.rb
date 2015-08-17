class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  validates :order_id, :name, :price, presence: true

  def as_json(options)
    super({:include => {:user => {only: :name}}}.merge(options))
  end
end
