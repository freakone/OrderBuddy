class User < ActiveRecord::Base
	validates :name, presence: true

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy

	def self.from_omniauth(auth)    
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires = Time.at(auth.credentials.expires_at)
      user.image = auth.info.image
      user.save!
    end
  end

end
