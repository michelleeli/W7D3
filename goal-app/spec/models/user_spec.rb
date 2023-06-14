require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_length_of(:password).is_at_least(6) }

  it 'validates presence of session_token' do
    user = build(:user)
    user.session_token = ''
    user.valid?
    expect(user).to_not be_valid
  end
end
