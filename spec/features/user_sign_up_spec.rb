require 'spec_helper'

feature 'Signing Up' do

  scenario '-> allows users to sign up for an account' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bob')
    expect(User.first.email).to eq('bob@bob.com')
  end

  scenario '-> user is expected to provide matching passwords' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario '-> user is expected to provide a valid email address' do
    expect{sign_up(email: 'bob@bob')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
  end

  scenario '-> duplicate registrations are prevented' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is already taken')
  end

end
