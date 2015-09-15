require 'rails_helper'

RSpec.describe User do

  include_examples 'valid_factory', :user

  describe '.from_omniauth' do

    context 'new user' do

      let(:auth) {
        double(provider: 'google', uid: '1234567890', info: double({ email: 'some@email.com', name: 'a name' }))
      }

      before do
        described_class.from_omniauth(auth)
      end

      it 'creates a new user' do
        expect(User.count).to eq 1
      end

      it 'sets user email' do
        expect(User.first.email).to eq 'some@email.com'
      end

      it 'sets user name' do
        expect(User.first.name).to eq 'a name'
      end

      it 'sets user provider' do
        expect(User.first.provider).to eq 'google'
      end

      it 'sets user uid' do
        expect(User.first.uid).to eq '1234567890'
      end

    end

    context 'returning user' do

      let!(:user) { create(:user, provider: 'google', uid: '1234567890') }

      let(:auth) {
        double(provider: 'google', uid: '1234567890', info: double({ email: 'some_new@email.com', name: 'a new name' }))
      }

      it 'doesnt create a new user' do
        described_class.from_omniauth(auth)
        expect(User.count).to eq 1
      end

      it 'returns the user' do
        expect(described_class.from_omniauth(auth)).to eq user
      end

    end

  end
  
end