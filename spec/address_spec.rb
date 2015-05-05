require('spec_helper')

describe('Address') do

  describe('#address') do
    it('returns the address of the contact') do
      address = Address.new({:address => "555 NW 222 Ave. Portland, OR 97225"})
      expect(address.address).to(eq("555 NW 222 Ave. Portland, OR 97225"))
    end
  end

  describe("#==") do
    it("is the same address if it has the same information") do
      address1 = Address.new({:address => "555 NW 222 Ave. Portland, OR 97225"})
      address2 = Address.new({:address => "555 NW 222 Ave. Portland, OR 97225"})
      expect(address1).to(eq(address2))
    end
  end
end
