require('rspec')
require('contact')

describe('Contact') do

  describe('#first_name') do
    it('returns the first name of a contact') do
      contact = Contact.new({:first_name => "Jennifer", :last_name => "Minetree"})
      expect(contact.first_name).to(eq("Jennifer"))
    end
  end

  describe('#last_name') do
    it('returns the last name of a contact') do
      contact = Contact.new({:first_name => "Jennifer", :last_name => "Minetree"})
      expect(contact.last_name).to(eq("Minetree"))
    end
  end
end
