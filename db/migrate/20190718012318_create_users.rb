class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :nick_name
      t.string :password
      t.string :avatars
      t.string :email
      t.string :mobile
      t.string :qq
      t.timestamps
    end
  end
end
