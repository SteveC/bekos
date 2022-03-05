class CreateUserChatStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_chat_statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :current_thread, null: true, foreign_key: { to_table: :chat_threads }
      t.string :manual_status
      t.timestamp :updated_at
    end
  end
end
