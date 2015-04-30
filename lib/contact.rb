class Contact

  @@contacts = []

  attr_reader(:first_name,:last_name, :id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name  = attributes.fetch(:last_name)
    @id         = @@contacts.size.+(1)
  end

  define_method(:save) do
    @@contacts.push(self)
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
end
