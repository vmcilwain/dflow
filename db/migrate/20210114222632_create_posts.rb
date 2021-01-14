class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :subject, null: false, default: ''
      t.text :content
      t.string :video_url, limit: 500
      t.integer :created_by, :updated_by
      t.timestamps
    end
  end
end
