require('sinatra')
require('sinatra/reloader')
require('./lib/contact.rb')
require('./lib/phone.rb')
also_reload('lib/**/*.rb')
#set(:show_exceptions, false)

get('/') do
  @all_contacts = Contact.all()

  erb(:index)
end

get('/contacts') do
  @all_contacts = Contact.all()

  erb(:contacts)
end

get('/contacts/new') do
  erb(:contact_form)
end

post('/contacts') do
  first_name = params.fetch('first_name')
  last_name  = params.fetch('last_name')

  contact = Contact.new({:first_name => first_name, :last_name => last_name})
  contact.save()
  redirect to('/')
end

get('/reset') do
  Contact.clear
  redirect to('/')
end

get('/contacts/:id') do
  contact_id = params.fetch('id').to_i
  @contact = Contact.find(contact_id)
  erb(:contact)
end

get('/contacts/:id/phones/new') do
  contact_id = params.fetch('id').to_i
  @contact = Contact.find(contact_id)
  erb(:phone_form)
end

post('/contacts/:id/phones') do
  contact_id      = params.fetch('id').to_i
  phone_number    = params.fetch('phone_number').to_i
  phone_area_code = params.fetch('phone_area_code')
  phone_type      = params.fetch('phone_type')

  contact = Contact.find(contact_id)
  contact.add_phone({:phone_number => phone_number,
                     :area_code    => phone_area_code,
                     :type         => phone_type})

  redirect to('/contacts')
end
