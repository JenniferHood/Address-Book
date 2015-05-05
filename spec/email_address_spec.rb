require('spec_helper')

describe('Email_Address') do

  describe('#email_address') do
    it('returns the email address of the contact') do
      email_address = Email_Address.new({:email_address => "hellworld@haha.com"})
      expect(email_address.email_address).to(eq("hellworld@haha.com"))
    end
  end

  describe("#==") do
    it("is the same phone number if it has the same numbers") do
      email_address1 = Email_Address.new({:email_address => "Helloworld@haha.com"})
      email_address2 = Email_Address.new({:email_address => "Helloworld@haha.com"})
      expect(email_address1).to(eq(email_address2))
    end
  end
end
