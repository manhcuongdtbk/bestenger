class MessagesController < ApplicationController
  before_action :set_channel, only: %i[create]

  def create
    @message = @channel.messages.create(message_params)
    MessageChannel.broadcast_to(@channel, message: render_to_string(@message))
  end

  private

  def set_channel
    @channel = current_user.channels.find(params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:content).merge(user: current_user)
  end
end
