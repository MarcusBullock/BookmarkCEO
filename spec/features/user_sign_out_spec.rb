require 'spec_helper'

feature 'Signing out' do

  let(:user) do
    User.create(name: 'bob',
                email: 'bob@bob.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario '-> can sign out while signed in' do
    sign_in(email: user.email, password: user.password)
    click_button('Sign out')
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, bob@bob.com')
  end
end
