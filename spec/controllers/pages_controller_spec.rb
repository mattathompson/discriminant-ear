require "rails_helper"

RSpec.describe PagesController do
  describe "GET landing" do
    context "authenticated user" do
      before {
        user = create :user, email: "user@example.com", password: "password"
        sign_in user
      }
      let(:response) {get :landing}
      specify {expect(response.status).to eq 200}
    end
  end
end
