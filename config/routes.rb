Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'},
            path: '',
            path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'}
            

  
  
end
