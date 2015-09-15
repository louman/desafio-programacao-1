require 'rails_helper'

RSpec.describe OrderItem do

  include_examples 'valid_factory', :order_item

  include_examples 'valid_associations', {
    belong_to: [:order]
  }

  context 'validations' do

    include_examples 'required_attributes', :order_item, [
      :unit_price, :description, :quantity,
    ]

    context '#quantity' do

      it 'validates numericality' do
        expect(build(:order_item, quantity: 'a')).not_to be_valid
      end

      it 'greater than 0' do
        expect(build(:order_item, quantity: 0)).not_to be_valid
      end

    end
  end
end
