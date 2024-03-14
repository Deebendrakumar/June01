class Blog < ApplicationRecord

    belongs_to :author
    
    validates_presence_of :content, :title, :short_description, :status, :publish_at
    
    include BlogAuthorActiveInactive

    # def make_inactive
    #     update(status: 'inactive')
    # end

    # def make_active
    #     update(status: "active")
    # end

end
