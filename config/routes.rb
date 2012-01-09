NewCartographers::Application.routes.draw do
  resources :inquiries

  match ':page_name' => 'pages#show'
  root to: 'pages#show'
end
