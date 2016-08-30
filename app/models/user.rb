class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(github_uid: auth_info[:uid]).first_or_create do |new_user|
      byebug
    new_user.uid                = auth_info.uid
    new_user.nickname           = auth_info.extra.raw_info.nickname
    new_user.screen_name        = auth_info.extra.raw_info.starred_url
    new_user.auth_token        = auth_info.credentials.token
    new_user.auth_token_secret = auth_info.credentials.secret
  end
  end
end
