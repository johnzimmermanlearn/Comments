class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, null: false, index: true, foreign_key: { on_delete: :restrict }
      t.string :headline, null: false
      t.string :url, null: false
      t.timestamps null: false
    end
  end
end
