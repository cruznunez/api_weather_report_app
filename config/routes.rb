Rails.application.routes.draw do
  root 'pages#home'
  post 'get' => 'weather#get'
end
