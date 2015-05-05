require("rspec")
require("pg")
require("contact")
require("phone")
require("email_address")
require("address")

DB = PG.connect({:dbname => 'address_book'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM contacts *;")
    DB.exec("DELETE FROM phones *;")
    DB.exec("DELETE FROM email_address *;")
    DB.exec("DELETE FROM address *;")
  end
end
