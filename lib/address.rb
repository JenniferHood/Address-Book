class Address
  attr_reader(:address)

  define_method(:initialize) do |attributes|
    @address = attributes.fetch(:address)
  end

  define_method(:==) do |another_address|
    self.address().==(another_address.address())
  end
end
