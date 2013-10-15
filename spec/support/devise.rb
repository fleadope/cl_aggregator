module ControllerUser
    def user
        @user ||= Fabricate(:user)
        @user
    end
end

module ControllerMacros

    def login_user
        before :each do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            sign_in user
        end
    end

end

RSpec.configure do |config|
    config.include Devise::TestHelpers, :type => :controller
    config.include ControllerUser, :type => :controller
    config.extend ControllerMacros, :type => :controller
end

