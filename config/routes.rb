Rails.application.routes.draw do
  post "users/:id/update" , to: "users#update"
  get "users/:id/edit",to: "users#edit"
  get "signup",to: "users#new"

  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  post "users/create" => "users#create"
  get "users/:id/destroy" => "users#destroy"


  # 投稿一覧ページを表示（表示　indexメソッド）
  get 'posts/index' => "posts#index"

  # 新規投稿ページを表示（表示　newメソッド）
  get "posts/new" => "posts#new"

  # 投稿内容個別ページを表示（表示　showメソッド）
  get "posts/:id" => "posts#show"

  # 投稿内容編集ページを表示（表示　editメソッド）
  get "posts/:id/edit" => "posts#edit"
  
  # 新規投稿作成（新規作成　cretaeメソッド）
  post "posts/create" => "posts#create"

  # 投稿を編集し保存する（編集＆保存　updateメソッド）
  post "posts/:id/update" => "posts#update"
  
  # 投稿内容削除
  get "posts/:id/destroy" => "posts#destroy"

  # トップページ
  get "/" =>"home#top"

  get "about" => "home#about"
 


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
