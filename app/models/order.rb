class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :user_id, :restauration, :phone, presence: true


  def as_json(options)
    #can_add = items.where(user_id: current_user.id)
    super({:include => {:items => { :include =>  { :user => {only: :name}}}, 
                        :user => {only: :name}}}.merge(options))
                        .merge({:can_add_item => !items.exists?(user_id: User.current_user.id)})


  end
end
