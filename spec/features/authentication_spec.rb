describe "a visitor", :type => :feature do
  it "redirects a visitor to the sign_in page" do
    visit "/"
    expect(current_path).to eq new_user_session_path
  end
end




describe "the signin process", :type => :feature do
  before :each do
    create :user, :email => 'user@example.com', :password => 'password'
  end

  it "signs me in" do
    visit '/users/sign_in'
    within("form") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully. The Discriminant Ear'
  end
end

describe "the registration process", :type => :feature do
  it "signs me up" do
    visit '/users/sign_up'
    within("form") do
      fill_in 'First name', :with => 'John'
      fill_in 'Last name', :with => 'Snow'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      fill_in "Password confirmation", :with => "password"
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully. The Discriminant Ear'
  end
end

describe "updating user details", :type => :feature do
  before {
    user = create :user, email: "user@example.com", password: "password"
    login_as(user, :scope => :user)
  }

  it "updates my email" do
    visit '/users/edit'
    within("form#edit_user") do
      fill_in 'Email', :with => 'new-email@example.com'
      fill_in 'Current password', :with => 'password'
    end

    click_button 'Update'
    expect(page).to have_content 'Your account has been updated successfully. The Discriminant Ear'
  end
end
