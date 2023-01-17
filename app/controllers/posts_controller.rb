class PostsController < ApplicationController
  def index
    # @posts = [
      # "今日からProgateでRailsの勉強するよー!",
      # "投稿一覧ページ作成中！"
    # ]
    #dbから全ての保存されたデータ取得
    @posts = Post.all
    
  end

  def show
    #paramsはデータを受け取るためのメソッド,クリックした投稿内容へジャンプ
    @post = Post.find_by(id: params[:id])
  end

  def new  
    # 投稿した内容をそのまま表示させるために@postに代入
    @post = Post.new
  end

  def create
    # 投稿内容受取
    @post = Post.new(content: params[:content])
    # 投稿内容保存
    if @post.save
      flash[:notice] = "投稿を作成しました"
    
    #投稿内容が問題なく保存できた場合 redirect_toでINDEX（投稿一覧へ）ジャンプする
    redirect_to("/posts/index")

    else
      # 保存できなかった場合は入力したデータそのまま新規投稿画面に戻す
      render("posts/new")
    end

    

  end

  def edit
    # 投稿した内容を表示
    @post = Post.find_by(id: params[:id])
  end

  def update
    #paramsはデータを受け取るためのメソッド,クリックした投稿内容へジャンプ
    @post = Post.find_by(id: params[:id])

    # 編集した投稿内容を@post.contentで再度受け取る。
    @post.content = params[:content]

    # 編集した投稿内容を保存
    if @post.save
          flash[:notice] = "投稿を編集しました"
          #問題なく編集保存できた場合は　投稿一覧へジャンプする
          redirect_to("/posts/index") 
    else
          # 保存できなかった場合は、編集入力画面に再度戻る
          render("/posts/edit")
    end
  end

  def destroy
    #paramsはデータを受け取るためのメソッド,クリックした投稿内容へジャンプ
    @post = Post.find_by(id: params[:id])

    # 編集した投稿内容を削除
    @post.destroy
    flash[:notice] = "投稿を削除しました"

    # 削除後投稿一覧へジャンプ
    redirect_to("/posts/index")

  end



end
