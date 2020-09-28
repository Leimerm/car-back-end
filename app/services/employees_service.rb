class EmployeesService
    def self.login(email, password)
      return false unless employee = Employee.find_by(email: email).try(:authenticate, password)
      employee.generate_token!
      employee
    end
  
    def self.register(email, first_name, last_name, password, password_confirmation)
      employee = Employee.new({
                          email: email,
                          first_name: first_name,
                          last_name: last_name,
                          password: password,
                          password_confirmation: password_confirmation
                      })
      return false unless employee.valid?
      employee.save
      employee.generate_token!
      employee
    end
  
    def self.logout(employee)
      employee.update(token: nil)
    end
  
end