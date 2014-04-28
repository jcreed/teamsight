require 'integration_test_helper'

describe 'homepage' do
	
	describe 'show' do
		it 'must see the homepage' do
			visit root_path
		  page.must_have_content 'Amherst Youth Hockey'
		end
	end

	describe 'Sign in as a user' do
		let(:user_email) {'jdoe@sample.com'}
		let(:password) {'abc123'}
		let(:firstname) {'John'}
		let(:lastname) {'Doe'}
	
		it 'allows the user to login with email and password' do
			visit root_path
			save_screenshot "pagea.png"
			fill_in 'Email:', with: user_email
			fill_in 'Password:', with: password
			save_screenshot "pageb.png"
			click_button 'Sign In'
			page.must_have_content "Welcome #{user_email}"
		end

		it 'will register a new user' do
			visit root_path
			click_link 'Register now'
			save_screenshot "page.png"
			page.must_have_content "Registration Page"
			fill_in 'Firstname:', with: firstname
			fill_in 'Lastname:', with: lastname
			fill_in 'Email:', with: user_email
			fill_in 'Password:', with: password
			save_screenshot "page1.png"
			click_button 'Submit'
			save_screenshot "page2.png"
			page.must_have_content "Registration Successful"
		end
	end
end