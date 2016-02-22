require 'spec_helper'

feature 'Signing in' do

  let(:user) do
    User.create(name: 'bob',
                email: 'bob@bob.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario '-> lets user sign in with correct details' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content('Welcome, bob')
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
