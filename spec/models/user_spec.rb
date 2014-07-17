require_relative '../rails_helper'

describe User do
  it { should validate_presence_of :provider }
  it { should validate_uniqueness_of(:uid).scoped_to(:username) }
end
