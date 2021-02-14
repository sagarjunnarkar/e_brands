require 'rails_helper'

RSpec.describe Company, type: :model do
  it "should belongs to user" do
    t = Company.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  it "should has many contributors" do
    t = Company.reflect_on_association(:contributors)
    expect(t.macro).to eq(:has_many)
  end

  it "should has many users" do
    t = Company.reflect_on_association(:users)
    expect(t.macro).to eq(:has_many)
  end   
end
