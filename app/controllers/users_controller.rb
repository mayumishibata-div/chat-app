class UsersController < ApplicationController

  def edit
    # ビューファイルを表示するだけなので、アクションの定義のみ
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
    # 保存できた場合とできなかった場合で条件分岐
    # current_user.updateに成功した場合、root（チャット画面）にリダイレクトします。
    # 失敗した場合、render :editとeditのアクションを指定しているため、editのビューが表示
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
    # permitメソッドを使用し、「name」と「email」の編集を許可
  end

end
