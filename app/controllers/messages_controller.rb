class MessagesController < ApplicationController
  def index
    @message = Message.new #@messageには、Message.newで生成した、Messageモデルのインスタンス情報を代入
    @room = Room.find(params[:room_id])  #@roomにはparamsに含まれているroom_idを代入
    @messages = @room.messages.includes(:user)
    # 全てのメッセージ情報に紐づくユーザー情報を、includes(:user)と記述をすることにより、ユーザー情報を1度のアクセスでまとめて取得することができます。
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.includes(:user)
        # 投稿に失敗した@messageの情報を保持しつつindex.html.erbの参照可。（この時、indexアクションは経由しない）
        # そのときに@messagesが定義されていないとエラーになるのでindexアクションと同様に@messagesを定義する必要があります。
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
