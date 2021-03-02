class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private
  
  def message_params
    params.require(:message).permit(:text).merge( user_id: current_user.id, tweet_id: params[:tweet_id])
  end

end
