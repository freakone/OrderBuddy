class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :user_id, :restauration, :phone, presence: true
end
