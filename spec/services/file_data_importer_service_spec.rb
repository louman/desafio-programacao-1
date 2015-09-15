require 'rails_helper'

describe FileDataImporterService do

  describe '#import!' do

    context 'import orders into the database' do

      let(:data) { 
        [
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
        ]
      }

      subject { described_class.new(data: data, upload: double(id: 1)) }

      before do
        subject.import!
      end

      it 'create orders' do
        expect(Order.count).to eq 2
      end

      context 'data sanity check' do

        let!(:order) { Order.find_by(customer_name: 'João Silva') }

        context 'order' do

          it 'merchant_address' do
            expect(order.merchant_address).to eq '987 Fake St'
          end

          it 'merchant_name' do
            expect(order.merchant_name).to eq "Bob's Pizza"
          end

          it 'total' do
            expect(order.total).to eq 20.0
          end

          it 'upload_id' do
            expect(order.upload_id).to eq 1
          end

        end

        context 'order_item' do

          let!(:order_item) { order.order_items.first }

          it 'unit_price' do
            expect(order_item.unit_price).to eq 10.0
          end

          it 'quantity' do
            expect(order_item.quantity).to eq 2
          end

          it 'description' do
            expect(order_item.description).to eq 'R$10 off R$20 of food'
          end

        end

      end
     
    end

  end

end