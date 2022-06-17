class MessagesController < ApplicationController
  def index
    @message = Message.new #@messageには、Message.newで生成した、Messageモデルのインスタンス情報を代入
    @room = Room.find(params[:room_id])  #@roomにはparamsに含まれているroom_idを代入
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
