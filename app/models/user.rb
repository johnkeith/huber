class User < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, uniqueness: { scope: :username }
  validates :uid, presence: true
  validates :email, presence: true
  validates :username, presence: true
  validates :full_name, presence: true
  validates :avatar_url, presence: true
  validates :access_token, presence: true
  validates :account_created, presence: true

  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_by(provider: provider, uid: uid) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create(
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      username: auth.info.nickname,
      full_name: auth.info.name,
      avatar_url: auth.info.image,
      access_token: auth.credentials.token, 
      account_created: auth.extra.raw_info.created_at
    )
  end
end
