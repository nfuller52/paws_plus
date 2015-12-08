require 'rails_helper'

RSpec.describe Vet, type: :model do
  it { expect(build(:vet)).to be_valid }

  describe "validations" do
    let(:vet) { build(:vet) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_length_of(:state).is_equal_to(2) }
    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_length_of(:zip).is_equal_to(5) }
    it { is_expected.to validate_presence_of(:phone) }

    it 'should fail with only 9 numbers for a phone' do
      vet.phone = '123456789'
      expect(vet).not_to be_valid
    end

    it 'should fail with 11 numbers for a phone' do
      vet.phone = '12345678900'
      expect(vet).not_to be_valid
    end

    it 'should successfully save with 10 numbers for a phone' do
      vet.phone = '1234567890'
      expect(vet).to be_valid
    end
  end

  describe '#phone=' do
    let(:vet) { build(:vet) }

    it 'does not save letters' do
      vet.phone = '800 - PAWSPLUS'
      expect(vet.phone).to eq('800')
    end

    it 'does not save non-numeric characters' do
      vet.phone = '(8!@#$%^&*()_+'
      expect(vet.phone).to eq('8')
    end

    it 'only saves numeric characters' do
      vet.phone = '(800).888-8908'
      expect(vet.phone).to eq('8008888908')
    end
  end
end
