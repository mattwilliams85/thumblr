require 'rails_helper'

describe Article do
	it { should validate_presence_of :header }
	it { should belong_to :user }
end