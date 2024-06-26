Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :boards, only: [:index, :new, :create, :destroy] do
    collection do
      get 'index/:song_id', to: 'boards#index', as: 'index_with_song'
    end
  end

  resources :songs, only: [] do
    collection do
      get 'song_name/:song_name', to: 'songs#song_name'
      get 'artist_name/:artist_name', to: 'songs#artist_name'
      get 'song_id_one/:song_name/:artist_name', to: 'songs#song_id_one'
      get 'song_data/:song_name/:artist_name', to: 'songs#song_data'
      get 'lyrics_search/:lyrics_word', to: 'songs#lyrics_search'
    end
    resources :responses, only: [:index, :create, :show, :update, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
