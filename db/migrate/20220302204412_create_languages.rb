class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages, id: false do |t|
      t.primary_key :code, :string
      t.string :name
      t.timestamp :created_at
    end
  end
end
