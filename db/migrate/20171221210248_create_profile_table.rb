class CreateProfileTable < ActiveRecord::Migration[5.1]
  def change
  create_table :profiles do |t|
  	t.string :picture
  	t.string :status
  	t.string :user_id
  end
  end
end