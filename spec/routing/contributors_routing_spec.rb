require "rails_helper"

RSpec.describe ContributorsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "api/contributors/1").to route_to("contributors#show", id: "1", format: :json)
    end


    it "routes to #create" do
      expect(post: "api/contributors").to route_to("contributors#create", format: :json)
    end
  end
end
