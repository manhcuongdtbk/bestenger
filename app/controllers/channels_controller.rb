class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[show]

  def index
    channel_ids = Message.active_messages.pluck(:channel_id)
    @channels = Channel.where(id: channel_ids, channel_type: Channel.channel_types[:public])
                       .or(Channel.where(id: current_user.channels.private_channel_type.ids))
                       .page(params[:page])
  end

  def show; end

  def create
    to_user = User.find(params[:to_user_id])
    created_channel_id = current_user.private_channel_id_with(to_user)

    if created_channel_id
      @channel = Channel.find(created_channel_id)
    else
      @channel = Channel.create(name: to_user.email, channel_type: Channel.channel_types[:private])
      @channel.users << [current_user, to_user]
    end

    redirect_to @channel
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
