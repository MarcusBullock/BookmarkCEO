def sign_up(name: 'bob',
             email: 'bob@bob.com',
             password: '12345678',
             password_confirmation: '12345678')
   visit '/users/new'
   fill_in :name, with: name
   fill_in :email, with: email
   fill_in :password, with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign up'
end
