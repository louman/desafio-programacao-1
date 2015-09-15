require 'rails_helper'

describe FileDataFormatterService do

  describe '#format' do

    context 'parses a tab separated file' do

      let(:data) { 
        [
          ['purchaser name', 'item description','item price', 'purchase count','merchant address','merchant name'],
          ['João Silva', 'R$10 off R$20 of food', '10.0', '2', '987 Fake St', "Bob's Pizza"],
          ['Amy Pond', 'R$30 of awesome for R$10', '10.0', '5', '456 Unreal Rd', "Tom's Awesome Shop"]
        ]
      }

      subject { described_class.new(data: data) }

      it 'returns an array' do
        expect(subject.format).to be_an(Array)
      end

      it 'without headers' do
        expect(subject.format).not_to match_array(['purchaser name', 'item description','item price', 'purchase count','merchant address','merchant name'])
      end

      it 'only with data' do
        expect(subject.format).to include(
          { 
            'purchaser-name'    => 'João Silva', 
            'item-description'  => 'R$10 off R$20 of food', 
            'item-price'        => '10.0', 
            'purchase-count'    => '2', 
            'merchant-address'  => '987 Fake St', 
            'merchant-name'     => "Bob's Pizza" 
          },
          { 
            'purchaser-name'    => 'Amy Pond', 
            'item-description'  => 'R$30 of awesome for R$10', 
            'item-price'        => '10.0', 
            'purchase-count'    => '5', 
            'merchant-address'  => '456 Unreal Rd', 
            'merchant-name'     => "Tom's Awesome Shop" 
          }
        )
      end

      it 'transforms headers into hash keys' do
        expect(subject.format.first.keys).to match_array(['purchaser-name', 'item-description','item-price', 'purchase-count','merchant-address','merchant-name'])
      end
     
    end

  end

end