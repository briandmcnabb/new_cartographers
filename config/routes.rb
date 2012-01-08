NewCartographers::Application.routes.draw do
  match ':page_name' => 'pages#show'
  root to: 'pages#show'
end
