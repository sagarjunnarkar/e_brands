require "rails_helper"

RSpec.describe ContributorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/contributors").to route_to("contributors#index")
    end

    it "routes to #show" do
      expect(get: "/contributors/1").to route_to("contributors#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/contributors").to route_to("contributors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/contributors/1").to route_to("contributors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/contributors/1").to route_to("contributors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/contributors/1").to route_to("contributors#destroy", id: "1")
    end
  end
end
