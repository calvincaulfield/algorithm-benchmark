module ApplicationHelper
    def admin_url
        "dev-bench.minami.im"
    end

    def is_admin
        request.host == admin_url
    end
end
