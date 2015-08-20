class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :user_id, :restauration, :phone, presence: true

  after_initialize :defaults

  def defaults
    self.delivered = false
    self.ordered = false
  end


  def get_json(user)
    return as_json({}).merge({:can_add_item => !items.exists?(user_id: user.id) && !self.ordered , :current_user_id => user.id, :can_delete => user.id == self.user_id && self.items.size == 0})
  end

  def as_json(options)
    super({:include => {:items => { :include =>  { :user => {only: [:name, :id]}}}, 
                        :user => {only: :name}}}.merge(options))                   
  end
end
