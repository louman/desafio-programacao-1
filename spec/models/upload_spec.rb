require 'rails_helper'

RSpec.describe Upload do

  include_examples 'valid_associations', {
    have_many: [:orders],
    belong_to: [:user]
  }

  it { is_expected.to have_attached_file(:attachment) }
  it { is_expected.to validate_attachment_content_type(:attachment).allowing('application/octet-stream') }

  describe '#orders_total' do

    let(:upload) { create(:upload) }
    let!(:orders) { create_list(:order, 5, upload_id: upload.id) }

    it 'sums orders total values' do
      expect(upload.orders_total).to eq 50.0
    end

  end

end
