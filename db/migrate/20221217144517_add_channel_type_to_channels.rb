class AddChannelTypeToChannels < ActiveRecord::Migration[7.0]
  def change
    add_column :channels, :channel_type, :string
  end
end
