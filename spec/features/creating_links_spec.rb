require 'spec_helper'

feature 'Creating Links' do

  scenario '-> users can add links to the database' do
    visit '/links/new'
    fill_in 'url', with: 'www.bbc.com'
    fill_in 'title', with: 'BBC'
    click_button 'Create link'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end
