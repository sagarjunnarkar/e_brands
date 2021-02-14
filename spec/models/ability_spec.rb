require 'rails_helper'
require "cancan/matchers"

RSpec.describe Ability, type: :model do
  describe "User" do
    describe "abilities" do
      subject(:ability) { Ability.new(user) }
      let(:user){ nil }
  
      context "when is an super_admin" do
        let(:user){ FactoryBot.create(:super_admin) }
  
        it { is_expected.to be_able_to(:manage, :all) }
      end

      context "when is an admin" do
        let(:user){ FactoryBot.create(:admin) }
  
        it { is_expected.to be_able_to(:create, Company) }
        it { is_expected.to be_able_to(:read, Company) }
        it { is_expected.to be_able_to(:invite, User) }
      end

      context "when is an contributor" do
        let(:user){ FactoryBot.create(:contributor_user) }
  
        it { is_expected.not_to be_able_to(:create, Company) }
        it { is_expected.to be_able_to(:read, Company) }
      end
    end
  end
end
