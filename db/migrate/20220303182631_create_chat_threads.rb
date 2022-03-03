class CreateChatThreads < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_threads do |t|
      t.string :language_code, foreign_key: { to_table: :languages } 
      t.bigint :user_ids, array: true
      t.timestamps
      t.index :user_ids, using: :gin
      t.index :language_code, unique: true
    end
  end
end
