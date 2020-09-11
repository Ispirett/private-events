# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    collection do
      get 'new_session'
      post 'create_session'
    end
  end

  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
