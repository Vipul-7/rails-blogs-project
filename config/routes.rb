Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/blog_post/new", to:"blog_posts#new",  as: :new_blog_post
  get "/blog_post/:id", to:"blog_posts#show",  as: :blog_post
  post "/blog_post" , to:"blog_posts#create" , as: :blog_posts
  
  # Defines the root path route ("/")
  root "blog_posts#index"
end
