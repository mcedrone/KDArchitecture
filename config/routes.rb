Kda::Application.routes.draw do

  resources :properties do
    collection do
      get  :edit_architecture
      get  :edit_interior_design
      get  :edit_additions
      get  :edit_renovations
      get  :edit_works_in_progress
    end
  end

  resources :users do
    member do
      get  :settings
      post :settings
    end
    collection do
      get  :settings
      post :settings
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  root 'dashboard#home'

  match 'about' => 'dashboard#about', via: [:get]
  match 'recognition' => 'dashboard#recognition', via: [:get]
  match 'affiliates' => 'dashboard#affiliates', via: [:get]
  match 'contact' => 'dashboard#contact', via: [:get]

  match 'architecture' => 'properties#architecture', via: [:get, :post]
  match 'interior_design' => 'properties#interior_design', via: [:get, :post]
  match 'renovations' => 'properties#renovations', via: [:get, :post]
  match 'additions' => 'properties#additions', via: [:get, :post]
  match 'works_in_progress' => 'properties#works_in_progress', via: [:get, :post]

  match 'edit_architecture' => 'properties#edit_architecture', via: [:get, :post]
  match 'edit_interior_design' => 'properties#edit_interior_design', via: [:get, :post]
  match 'edit_renovations' => 'properties#edit_renovations', via: [:get, :post]
  match 'edit_additions' => 'properties#edit_additions', via: [:get, :post]
  match 'edit_works_in_progress' => 'properties#edit_works_in_progress', via: [:get, :post]

  match 'signin' => 'sessions#new', via: [:get, :post]
  match 'signout' => 'sessions#destroy', via: [:delete]

end
