class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.belongs_to :contact
      t.belongs_to :message
    end
  end
end
