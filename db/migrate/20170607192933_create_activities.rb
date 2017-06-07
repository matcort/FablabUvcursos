class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :user_id
      t.string :browser
      t.string :ip_address
      t.string :controller
      t.string :action
      t.string :params
      t.string :note

      t.timestamps null: false
    end
  end
end
