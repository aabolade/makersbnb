module WebHelpers

def sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: "jane@email.com"
  fill_in "password", with: "abcd1234"
  fill_in "password_confirm", with: "abcd1234"
  click_button "submit"
end

def invalid_email_sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: "not_an_email"
  fill_in "password", with: "abcd1234"
  fill_in "password_confirm", with: "abcd1234"
  click_button "submit"
end

def no_match_password_sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: "jane@gmail.com"
  fill_in "password", with: "abcd1234"
  fill_in "password_confirm", with: "abcd"
  click_button "submit"
end

# methods for testing here
  def create_listing( name:        "Peacock Paradise Private Villa",
                      description: "My home has peacocks and a pool.",
                      price:       "50",
                      location_city: "London",
                      location_country: "United Kingdom",
                      available_from:  "12/12/2016",
                      available_until: "22/04/2017" )
    visit '/listings/new'
    fill_in :name, with: name
    fill_in :description, with: description
    fill_in :price, with: price
    fill_in :city, with: location_city
    fill_in :country, with: location_country
    fill_in :available_from, with: available_from
    fill_in :available_until, with: available_until
    click_button "List my Property"
  end

  def create_incomplete_listing( name:        "Peacock Paradise Private Villa",
                      description: "",
                      price:       "",
                      location_city: "London" )
    visit '/listings/new'
    fill_in :name, with: name
    fill_in :description, with: description
    fill_in :price, with: price
    fill_in :city, with: location_city
    click_button "List my Property"
  end

def no_email_sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: ""
  fill_in "password", with: "abcd1234"
  fill_in "password_confirm", with: "abcd1234"
  click_button "submit"
end

def no_password_sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: "jane@gmail.com"
  fill_in "password", with: ""
  fill_in "password_confirm", with: ""
  click_button "submit"
end

def correct_log_in
  visit '/sessions/new'
  fill_in "email", with:  'jane@email.com'
  fill_in "password", with: 'abcd1234'
  click_button 'log-in'
end

def incorrect_log_in
  visit '/sessions/new'
  fill_in "email", with:  'jane@email.com'
  fill_in "password", with: 'abcd4'
  click_button 'log-in'
end

def make_request
  sign_up
  create_listing
  correct_log_in
  visit '/listings'
  click_link('Peacock Paradise Private Villa')
  click_button 'Request'
end

end
