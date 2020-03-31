# frozen_string_literal: true

Rails.application.routes.draw do
  resources :stories
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }, path: "", path_names: { sign_in: "login", sign_out: "logout" }

  devise_scope :user do
    root "users/sessions#new"
  end
end
