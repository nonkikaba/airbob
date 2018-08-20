Rails.application.routes.draw do
  devise_for :users,
            path: '',
            path_name: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
            controllers: {omnniauth_callbacks: 'users/omniauth_callbacks'}

  root 'pages#home'
  
end
