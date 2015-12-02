require 'rails_helper'

RSpec.describe State, type: :model do
  it { expect(build(:state)).to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:abbreviation) }
  it { is_expected.to validate_length_of(:abbreviation).is_equal_to(2) }
end
