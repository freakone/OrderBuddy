class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :user_id, :restauration, :phone, presence: true


  def get_json(user)
    return as_json({}).merge({:can_add_item => !items.exists?(user_id: user.id), :current_user_id => user.id})
  end

  def as_json(options)
    super({:include => {:items => { :include =>  { :user => {only: [:name, :id]}}}, 
                        :user => {only: :name}}}.merge(options))                   
  end
end
