Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/sse-demo", to: "sse_demo#index"
  get "/sse", to: "sse#index"
end
