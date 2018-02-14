class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.text   :address
      t.string :username, unique: true
      t.text :password_digest

      t.timestamps
    end
  end
end
