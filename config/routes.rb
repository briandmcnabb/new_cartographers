NewCartographers::Application.routes.draw do
  resources :inquiries
  resource :mailing_list_subscriptions, only: [:create, :destroy]

  match ':page_name' => 'pages#show'
  root to: 'pages#show'
end
