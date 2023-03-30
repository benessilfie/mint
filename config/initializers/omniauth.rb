# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?

  provider(
    :twitter2,
    Rails.application.credentials.twitter[:client_id],
    Rails.application.credentials.twitter[:client_secret],
    callback_path: '/auth/twitter2/callback',
    scope: 'tweet.read users.read bookmark.read offline.access'
  )
end
