require "rails_helper"

RSpec.describe PagesController do
  describe "GET landing" do
    let(:response) {get :landing}
    specify {expect(response.status).to eq 200}
  end
end
