class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  
    @user = User.new
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(name: params[:name], email: params[:email])
    # 保存が成功したかどうかで条件分岐をしてください
     if @user.save
         flash[:notice] = "ユーザー登録が完了しました"
         redirect_to("/users/#{@user.id}")
     else
        render("users/new")
     end
    end

    def edit
      @user = User.find_by(id: params[:id])
    end

    def  update
      @user = User.find_by(id: params[:id])
      @user.name = params[:name]
      @user.email = params[:email]
      if @user.save
        flash[:notice] = "ユーザー情報を編集しました"
        redirect_to("/users/#{@user.id}")
      else
        render("users/edit")
      end
    end

    def destroy
      @user = User.find_by(id: params[:id])
      @user.destroy
        flash[:notice] = "削除しました"
        redirect_to("/users/index")
      
    end
  
  
end

