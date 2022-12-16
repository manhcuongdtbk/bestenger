class MessageChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    channel = Channel.find(params[:id])
    stream_for(channel)
  end

  def unsubscribed
    stop_all_streams
  end
end
