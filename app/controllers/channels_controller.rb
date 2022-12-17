class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[show]

  def show; end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
