class CreateReply < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :from
      t.text :body
      t.timestamps
    end
  end
end
