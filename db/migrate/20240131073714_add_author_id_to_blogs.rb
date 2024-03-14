class AddAuthorIdToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :blogs, :author, null: false, foreign_key: true
  end
end
