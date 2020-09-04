class Api::V1::EmployeesController < ApplicationController
    def login
        render json: { error: "User not authenticated" }, status: 401 and return unless @employee = EmployeesService.login(params[:email], params[:password])
        render json: @employee.profile, status: :ok
      end
    
      def create
        @user = EmployeesService.register(params[:email], params[:first_name], params[:last_name], params[:nickname], params[:password_digest])
        render json: { error: "There was a problem saving your user" }, status: :unprocessable_entity and return unless @employee
        render json: @employee.profile, status: :ok
      end
    
      def logout
        render json: { error: "There was a problem logging out" }, status: :unprocessable_entity and return unless EmployeesService.logout(@current_employee)
        render json: { success: "You have been logged out" }, status: :ok
      end
    
      def me
        render json: @current_employee.profile, status: :ok
      end
      def employee_params
        params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
      end
end
