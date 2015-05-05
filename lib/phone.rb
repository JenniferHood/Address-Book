class Phone
  attr_reader(:phone_number, :area_code, :type)

  define_method(:initialize) do |stuff|
    @phone_number = stuff.fetch(:phone_number)
    @area_code    = stuff.fetch(:area_code)
    @type         = stuff.fetch(:type)
  end

define_method(:==) do |another_phone|
  self.phone_number().==(another_phone.phone_number()).&(self.area_code().==(another_phone.area_code()))
end
end
