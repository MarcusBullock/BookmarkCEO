require 'spec_helper'

feature 'Adding Tags' do

  scenario '-> allows users to tag links' do
    visit('/links/new')
    fill_in 'url', with: 'www.bbc.com'
    fill_in 'title', with: 'BBC'
    fill_in 'tags', with: 'news'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end

  scenario '-> allows users to add multiple tags' do
    visit('/links/new')
    fill_in 'url', with: 'www.bbc.com'
    fill_in 'title', with: 'BBC'
    fill_in 'tags', with: 'news sport'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news', 'sport')
  end

end
