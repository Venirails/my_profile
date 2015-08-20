class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :encrypted_password
      t.string :email
      t.date :date_of_birth
      t.integer :mobile
      t.attachment :profile_image

      t.timestamps
    end
  end
end
