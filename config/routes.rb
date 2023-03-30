# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#root'

  get 'auth/:provider/callback', to: 'sessions#create'
  post 'auth/:provider/callback', to: 'sessions#create'
end
