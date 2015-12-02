require 'rails_helper'

RSpec.describe Vet, type: :model do
  it { expect(build(:vet)).to be_valid }

  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_length_of(:state).is_equal_to(2) }
    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_length_of(:zip).is_equal_to(5) }
  end
end
