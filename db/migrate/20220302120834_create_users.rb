class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :first_name, :last_name
      t.string :password_digest, null: false
      t.string :language_codes, array: true
      t.timestamps
    end
  end
end
