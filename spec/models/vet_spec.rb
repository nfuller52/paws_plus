require 'rails_helper'

RSpec.describe Vet, type: :model do
  it { expect(build(:vet)).to be_valid }
end
