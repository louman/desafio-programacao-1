require 'rails_helper'

describe FileParserService do

  describe '#parse' do

    context 'parses a tab separated file' do

      let!(:file) { File.open(File.join(Rails.root, 'spec', 'fixtures', 'tab_file.tab')) }

      subject { described_class.new(file: file) }

      context 'returns an array' do

        let(:headers) { ['purchaser name', 'item description','item price', 'purchase count','merchant address','merchant name'] }
        let(:row_1)   { ['João Silva', 'R$10 off R$20 of food', '10.0', '2', '987 Fake St', "Bob's Pizza"] }
        let(:row_2)   { ['Amy Pond', 'R$30 of awesome for R$10', '10.0', '5', '456 Unreal Rd', "Tom's Awesome Shop"] }

        it 'including headers' do
          expect(subject.parse[0]).to match_array(headers)
        end

        it 'including data' do
          expect(subject.parse).to include(row_1, row_2)
        end

      end
     
    end

  end

end