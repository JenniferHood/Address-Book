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
      click_link('Return Home')
      expect(page).to(have_content('Your Address Book!'))
    end
  end

  describe('/contacts path') do
    it('shows message when no contacts exist') do
      click_link('See your Contacts List')
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
end
