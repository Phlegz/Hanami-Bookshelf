# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/

root to: 'home#index'
resources :books, only: [:index, :new, :create]
