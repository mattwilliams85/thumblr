require 'rails_helper'

describe Article do
	it { should validate_presence_of :header }
end