class ChannelsUsersController < ApplicationController
  before_action :set_channel, only: %i[create]

  def create
    @channel.channels_users.where(user: current_user).first_or_create
    redirect_to @channel
  end

  private

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end
end
