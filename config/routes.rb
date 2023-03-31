# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#root'

  match 'auth/:provider/callback', to: 'sessions#create', via: %i[get post]
end
