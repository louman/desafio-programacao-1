require 'rails_helper'

describe FileUploaderService do

  describe '#upload_file' do

    let(:file) { File.open(File.join(Rails.root, 'spec', 'fixtures', 'tab_file.tab')) }
    let(:user) { create(:user) }

    subject { described_class.new(upload_params: ActionController::Parameters.new({ attachment: file }), user: user) }

    context 'success' do

      let!(:result) { subject.upload_file }

      it 'returns true on success' do
        expect(result).to be_truthy
      end

      context 'data creation' do

        it 'creates an upload record' do
          expect(Upload.first).to be_present
        end

        it 'creates orders' do
          expect(Order.count).to eq 2
        end

      end

    end

    context 'failure' do

      let(:file) { File.open(File.join(Rails.root, 'spec', 'fixtures', 'tab_file.txt')) }
      let!(:result) { subject.upload_file }

      it 'returns false on failure' do
        expect(result).to be_falsy
      end

      it 'returns an error message' do
        expect(subject.errors_full).to eq 'Não foi possível realizar a importação, verifique o formato do arquivo.'
      end

    end

  end

end