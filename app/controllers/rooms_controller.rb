class RoomsController < ApplicationController

  def new 
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save #保存が成功した時＝ルートパスにリダイレクト
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids: []) #配列に対して保存を許可したい場合は、キーに対し[]を値として記述します。
      
  end
end
