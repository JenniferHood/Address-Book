class Email_Address
  attr_reader(:email_address)

  define_method(:initialize) do |attributes|
    @email_address = attributes.fetch(:email_address)
  end


  define_method(:==) do |another_email_address|
    self.email_address().==(another_email_address.email_address())
  end
end
