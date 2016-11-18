module ControllerMacros
  def login_employee
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:employee]
      sign_in FactoryGirl.create(:employee)
    end
  end
end
