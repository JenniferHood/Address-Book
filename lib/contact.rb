class Contact

  @@contacts = []

  attr_reader(:first_name,:last_name, :id, :phone_numbers)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name  = attributes.fetch(:last_name)
    @id         = @@contacts.size.+(1)
    @phone_numbers = []
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_method(:add_phone) do |stuff|
    area_code = stuff.fetch(:area_code)
    type = stuff.fetch(:type)
    phone_number = stuff.fetch(:phone_number)

    phone = Phone.new({:area_code => area_code, :type => type, :phone_number => phone_number})
    @phone_numbers.push(phone)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |target_id|
    contact_match = nil

    @@contacts.each do |contact|
      if contact.id == target_id
        contact_match = contact
      end
    end

    contact_match
  end

  define_method(:==) do |another_contact|
    self.first_name().==(another_contact.first_name()).&(self.last_name().==(another_contact.last_name()))
  end
end
