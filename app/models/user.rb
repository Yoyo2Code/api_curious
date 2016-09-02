class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.username           = auth_info.extra.raw_info.login
      # new_user.username           = auth_info.extra.raw_info.login
      new_user.picture_url        = auth_info.extra.raw_info.avatar_url
      # new_user.screen_name        = auth_info.extra.raw_info.starred_url
      new_user.auth_token         = auth_info.credentials.token
      # new_user.auth_token_secret  = auth_info.credentials.secret
      new_user.followers          = auth_info.extra.raw_info.followers
      new_user.following          = auth_info.extra.raw_info.following
    end
  end
end
