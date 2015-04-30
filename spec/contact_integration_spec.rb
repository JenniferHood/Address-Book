require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application

describe('the address book app', :type => :feature) do
  before do
    Contact.clear()
    visit('/')
  end

  describe('/ path') do
    it('loads the home page') do
      expect(page).to(have_content('Address Book'))
    end
  end

  describe('/contacts path') do
    it('shows message when no contacts exist') do
      expect(page).to(have_content('No contacts exist'))
    end

    it('shows list of contacts if contacts exist') do
      click_link('Add a new contact')
      fill_in('first_name', :with => 'Bill')
      fill_in('last_name', :with => 'Brasky')
      click_button('Submit!')

      expect(page).to(have_content('Bill Brasky'))
    end
  end

  describe('/contacts/:id path') do
    it('shows the contact details for a specific contact') do
      click_link('Add a new contact')
      fill_in('first_name', :with => 'Bugs')
      fill_in('last_name', :with => 'Bunny')
      click_button('Submit!')
      click_link('Bugs Bunny')
      expect(page).to(have_content('Bugs Bunny Contact Info'))
    end
  end

  describe('/contacts/:id/phones') do
    it('it shows the number details of the contact') do
      click_link('Add a new contact')
      fill_in('first_name', :with => 'Bugs')
      fill_in('last_name', :with => 'Bunny')
      click_button('Submit!')
      click_link('Bugs Bunny')
      click_link('Please add phone number for Bugs')
      fill_in('phone_area_code', :with => 333)
      fill_in('phone_number', :with => 4444444444)
      select('Work', :from => 'phone_type')
      click_button('Submit!')
      click_link('Bugs Bunny')
      expect(page).to(have_content('Area code: 333'))
      expect(page).to(have_content('Phone number: 4444444444'))
      expect(page).to(have_content('Phone type: Work'))
    end
  end
end
