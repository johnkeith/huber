module LoginHelper
  def set_omniauth(user)
    OmniAuth.config.test_mode = true
    auth_hash = {
      provider: user.provider, 
      uid: user.uid,
      username: user.username,
      avatar_url: user.avatar_url,  
      email: user.email,
      access_token: user.access_token,
      account_created: user.account_created
    }
    OmniAuth.config.add_mock(:github, auth_hash)
  end
end
