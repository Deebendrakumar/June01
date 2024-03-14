class CreateAuthors < ActiveRecord::Migration[7.1]
  def up
    create_table :authors do |t|

      # primary_key: :email

      t.string :name, index: true
      t.string :email, index: { unique: true, name: 'unique_emails' }
      t.string :password
      t.string :status

      t.timestamps
    end

    def down
      drop_table :authors
    end

  end
end
