require "rails_helper"

RSpec.describe CompaniesController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "api/companies/1").to route_to("companies#show", id: "1", format: :json)
    end

    it "routes to #create" do
      expect(post: "api/companies").to route_to("companies#create", format: :json)
    end
  end
end
