module ApplicationHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def current_page(path)
        current_page?(path) ? true : false
    end
end
