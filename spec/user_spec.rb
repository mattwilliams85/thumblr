require 'rails_helper'

describe User do
	it { should validate_presence_of :email }
	it { should validate_uniqueness_of :email }
	it { should validate_presence_of :password }
	it { should ensure_length_of(:password).is_at_least(7) }
	it { should ensure_length_of(:password).is_at_most(20) }
	it { should have_secure_password }
end
