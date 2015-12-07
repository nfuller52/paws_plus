require 'rails_helper'

RSpec.describe Phone, type: :model do
  let(:phone) { Phone.new }

  it { expect(build(:phone)).to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:phone_type) }

    it 'should fail with only 9 numbers for a phone' do
      phone.number = '123456789'
      expect(phone).not_to be_valid
    end

    it 'should fail with 11 numbers for a phone' do
      phone.number = '12345678900'
      expect(phone).not_to be_valid
    end

    it 'should successfully save with 10 numbers for a phone' do
      phone.number = '1234567890'
      expect(phone).to be_valid
    end
  end

  describe '#phone_type' do
    let(:phone) { [:mobile, :home, :business, :fax] }

    it 'has the correct index' do
      phone.each_with_index do |item, index|
        expect(Phone.phone_types[item]).to eq(index)
      end
    end
  end

  describe '#number=' do
    it 'does not save letters' do
      phone.number = '800 - PAWSPLUS'
      expect(phone.number).to eq('800')
    end

    it 'does not save non-numeric characters' do
      phone.number = '(8!@#$%^&*()_+'
      expect(phone.number).to eq('8')
    end

    it 'only saves numeric characters' do
      phone.number = '(800).888-8908'
      expect(phone.number).to eq('8008888908')
    end
  end
end
