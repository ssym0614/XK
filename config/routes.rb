Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :account_types
  resources :transaction_categories
  resources :journal_entries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
