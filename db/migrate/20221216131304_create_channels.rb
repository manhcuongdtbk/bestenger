class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
