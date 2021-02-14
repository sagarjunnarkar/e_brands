require 'rails_helper'

RSpec.describe User, type: :model do
  let(:super_admin){ FactoryBot.create(:super_admin) }
  let(:admin){ FactoryBot.create(:admin) }
  it "should has many contributors" do
    t = User.reflect_on_association(:contributors)
    expect(t.macro).to eq(:has_many)
  end

  it "should has many users" do
    t = User.reflect_on_association(:companies)
    expect(t.macro).to eq(:has_many)
  end

  it 'should set role admin when super_admin invites' do
    invited_user = User.invite!({email: 'valid@email.com'}, super_admin)
    expect(invited_user.roles).to eq([])
    invited_user.accept_invitation!
    expect(invited_user.has_role?(:admin)).to eq(true)
  end

  it 'should set role contributor when admin invites' do
    invited_user = User.invite!({email: 'valid@email.com'}, admin)
    expect(invited_user.roles).to eq([])
    invited_user.accept_invitation!
    expect(invited_user.has_role?(:contributor)).to eq(true)
  end
end
