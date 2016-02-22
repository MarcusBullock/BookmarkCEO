require 'spec_helper'

feature 'Viewing links' do

  before(:each) do
    Link.create(url: 'www.bbc.com', title: 'BBC', tags:[Tag.first_or_create(name: 'news')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario '-> allows the user to see links' do
    Link.create(url: 'www.bbc.com', title: 'BBC')
    visit('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end

  scenario '-> allows users to filter links based on tags' do
    visit('/tags/bubbles')
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('news')
      expect(page).not_to have_content('search')
      expect(page).to have_content('bubbles')
    end
  end
end
