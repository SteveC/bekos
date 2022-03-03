class CreateChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_messages do |t|
      t.references :thread, null: false, foreign_key: { to_table: :chat_threads }
      t.references :user, null: false, foreign_key: true
      t.string :text
      t.timestamps
    end
  end
end
