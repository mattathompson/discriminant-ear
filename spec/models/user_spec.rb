RSpec.describe User do
  # describe ""
  it "can be initialized" do
    user = User.new
    expect(user).to be_an_instance_of User
  end

end
