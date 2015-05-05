require('spec_helper')


describe('Contact') do
  before do
    Contact.clear()
  end

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

  describe('.find') do
    it('returns a contact object') do
      contact = Contact.new({:first_name => "Jennifer", :last_name => "Minetree"})
      contact.save()
      expect(Contact.find(contact.id)).to(eq(contact))
    end
  end

  describe("#==") do
    it("is the same contact if it has the same name") do
      contact1 = Contact.new({:first_name => "Jennifer", :last_name => "Minetree"})
      contact2 = Contact.new({:first_name => "Jennifer", :last_name => "Minetree"})
      expect(contact1).to(eq(contact2))
    end
  end
end
