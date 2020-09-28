class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate

    def authenticate
        authenticate_token || render_unauthorized
    end

    def authenticate_token
        authenticate_with_http_token do |token, options|
            @current_employee = Employee.find_by(token: token)
            @current_employee
        end
    end

    def render_unauthorized
        logger.debug "**** UNAUTHORIZED REQUEST: '#{request.env['HTTP_AUTHORIZATION']}' ***"
        self.headers['WWW-Authenticate'] = 'Token realm="Application"'
        render json: {error: "Bad crednetials"}, status: 401
    end
end 