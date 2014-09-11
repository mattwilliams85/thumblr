require 'rails_helper'

describe User do
	it { should validate_presence_of :email }
	it { should validate_uniqueness_of :email }
	it { should_not allow_value("test.com").for(:email) }
	it { should validate_presence_of :password }
	it { should ensure_length_of(:password).is_at_least(7) }
	it { should ensure_length_of(:password).is_at_most(20) }
	it { should validate_numericality_of(:password).
      with_message("must have at least one number") }	
	it { should have_secure_password }
	it { should have_many :articles }
end
