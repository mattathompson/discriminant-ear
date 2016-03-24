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
