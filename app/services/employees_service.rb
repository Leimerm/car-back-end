class EmployeesService
    def self.login(email, password)
      return false unless user = Employee.find_by(email: email).try(:authenticate, password)
      employee.generate_token!
      employee
    end
  
    def self.register(email, first_name, last_name, nickname, password)
      Employee = Employee.new({
                          email: email,
                          first_name: first_name,
                          last_name: last_name,
                          nickname: nickname,
                          password_digest: password,
                      })
      return false unless user.valid?
      employee.save
      employee.generate_token!
      employee
    end
  
    def self.logout(user)
      employee.update(token: nil)
    end
  
end