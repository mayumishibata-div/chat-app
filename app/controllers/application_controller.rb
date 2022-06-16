class ApplicationController < ActionController::Base
  before_action :authenticate_user!
    # ログイン状態によって表示するページを切り替えるdeviseのメソッド。
    # authenticate_user!メソッドは、処理が呼ばれた段階で、ユーザーがログインしていなければ、そのユーザーをログイン画面に遷移させます。
  before_action :configure_permitted_parameters, if: :devise_controller?
    #before_actionを使用しているため、全てのアクションが実行される前に、 before_action :configure_permitted_parameters, if: :devise_controller?が実行されることになります。
    # deviseのコントローラーから呼び出された場合は、configure_permitted_parametersメソッドが呼ばれます。

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # devise_parameter_sanitizer:特定のカラムを許容するメソッド
    # permitでsign_upの時にnameキーの内容の保存をpermitメソッドで許可しています。

  end
end
