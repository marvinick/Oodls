require 'rails_helper'
require_relative 'charity_helper'

include CharityHelper

feature 'Donor' do

	context 'looking to make a donation' do

		scenario 'should be able to view all the charities signed up' do
			multi_sign_up
			visit '/'
			click_link 'Where to give?'
			expect(page).to have_content 'All Charities'
			expect(page).to have_content 'Crisis'
			expect(page).to have_content 'Second Charity'
		end

		scenario 'should be able to visit the website' do
			sign_up_with_website
			click_link 'Where to give?'
			expect(page).to have_link 'Visit the website'
			click_link 'Visit the website'
			expect(current_url).to eq 'http://www.crisis.org.uk/'
		end

		scenario 'should be able to find out donation guidelines' do
			visit '/'
			click_link 'How to give?'
			expect(page).to have_content 'Donation Guidelines'
		end

		scenario 'should be able to see if there is more they can do' do
			visit '/'
			click_link 'What more can I do?'
			expect(page).to have_content 'What else can I do?'
		end

		scenario 'should be able to contact site admin' do
			visit '/'
			expect(page).to have_content 'Contact Us'
			# click_link 'Contact Us' uncomment when this goes somewhere
			# expect(page).to have_content 'Contact Us' ditto above
		end

	end

end