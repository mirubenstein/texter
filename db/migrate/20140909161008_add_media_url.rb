class AddMediaUrl < ActiveRecord::Migration
  def change
    add_column :messages, :mediaUrl, :string
  end
end
