module BlogAuthorActiveInactive
    extend ActiveSupport::Concern

    def make_inactive
        update(status: 'inactive')
    end

    def make_active
        update(status: "active")
    end

end