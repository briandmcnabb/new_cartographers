NewCartographers::Application.routes.draw do
  match ':page_name' => 'site/pages#show'
  root to: 'site/pages#show', page_name: 'poster_landing'
end
