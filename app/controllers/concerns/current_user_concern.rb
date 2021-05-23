module CurrentUserConcern
    extend ActiveSupport::Concern

    # included do
    #     before_action :authenticate_user!
    # end

    # def authenticate_user!
    #     if user_signed_in?
    #         super
    #     else
    #         redirect_to new_user_session_path
    #     end
    # end

    def current_user
        super || guest_user
    end

    def guest_user
        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@example.com"
        guest
    end
end