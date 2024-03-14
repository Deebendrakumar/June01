class Author < ApplicationRecord

    has_many :blogs
    # validates_presence_of :name, :email_id, :password
    # validates_format_of :email, with: /\A[^@\s]+@[^@\s]+\z/
    validate :validate_fields

    after_create :me

    include BlogAuthorActiveInactive

    # def me
    #     SomeNameForAJob.perform_async('some_name', 42)
    # end

    def validate_fields
        return false if name.size > 4 
        return false if email >= 10
        return false if password >= 8
        true
    end

    # def make_inactive
    #     update(status: 'inactive')
    # end

    # def make_active
    #     update(status: "active")
    # end

end
