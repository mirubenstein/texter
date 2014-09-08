require 'rails_helper'

describe Contact do
  it { should have_many :messages }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :name }
end
