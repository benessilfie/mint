class User < ApplicationRecord
  def self.create_with_omniauth(user_info)
    create!(
      twitter_id: user_info['uid'],
      nickname: user_info['info']['nickname'],
      name: user_info['info']['name'],
      token: user_info['credentials']['token'],
      refresh_token: user_info['credentials']['refresh_token'],
      expires_at: Time.at(user_info['credentials']['expires_at']).to_datetime
    )
  end
end
