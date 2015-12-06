require 'rails_helper'

RSpec.describe Vets::RegistrationsController, type: :controller do
  let(:vet) { create(:vet) }

  # http://stackoverflow.com/questions/6659555/how-to-write-controller-tests-when-you-override-devise-registration-controller
  before { request.env['devise.mapping'] = Devise.mappings[:vet] }

  describe "DELETE #destroy" do
    it 'should return 404 response' do
      sign_in(vet)

      expect { delete :destroy, id: vet }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
