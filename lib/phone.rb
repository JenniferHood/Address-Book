class Phone
  attr_reader(:phone_number, :area_code, :type)

  define_method(:initialize) do |stuff|
    @phone_number = stuff.fetch(:phone_number)
    @area_code    = stuff.fetch(:area_code)
    @type         = stuff.fetch(:type)
  end
end
