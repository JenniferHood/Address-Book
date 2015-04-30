require('rspec')
require('phone')

describe('Phone') do

  before do
    @phone = Phone.new({:phone_number => 5551112222, :area_code => 805, :type => 'Home'})
  end

  describe('#phone_number') do
    it('returns the number of the phone number') do
      expect(@phone.phone_number).to(eq(5551112222))
    end
  end

  describe('#area_code') do
    it('returns the area code of the phone number') do
      expect(@phone.area_code).to(eq(805))
    end
  end

  describe('#type') do
    it('returns the type of phone number') do
      expect(@phone.type).to(eq('Home'))
    end
  end
end
