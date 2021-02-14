require 'rails_helper'

RSpec.describe Contributor, type: :model do
  let(:super_admin){ FactoryBot.create(:super_admin) }
  let(:admin){ FactoryBot.create(:admin) }

  it "should belongs to company" do
    t = Contributor.reflect_on_association(:company)
    expect(t.macro).to eq(:belongs_to)
  end

  it "should belongs to user" do
    t = Contributor.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  context "" do
    let!(:admin) { FactoryBot.create(:admin) }
    let!(:company) { FactoryBot.create(:company) }
    let(:contributor) { Contributor.create(company_id: company, user_id: admin.id) }
    
    it "validate uniquness of company with scope user" do 
      c = Contributor.new(company_id: contributor.company_id, 
                          user_id: contributor.user_id)
      expect(c).to_not be_valid
      # expect(c.errors[:user]).to match_array (["already a contributor"])
    end
  end

end
