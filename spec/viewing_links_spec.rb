require 'spec_helper'

feature 'Viewing links' do

  scenario '-> allows the user to see links' do
    Link.create(url: 'www.bbc.com', title: 'BBC')
    visit('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end
