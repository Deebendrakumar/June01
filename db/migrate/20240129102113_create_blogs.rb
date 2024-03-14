class CreateBlogs < ActiveRecord::Migration[7.1]
  def up
    create_table :blogs do |t|

      t.string :content
      t.string :title
      t.string :short_description
      t.string :status 
      t.date :publish_at

      t.timestamps
    end

  def down
    drop_table :blogs
  end

  end
end
