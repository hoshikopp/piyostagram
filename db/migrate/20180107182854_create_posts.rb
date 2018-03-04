class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "user_id"

      t.timestamps
    end
  end
end
