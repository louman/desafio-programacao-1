require 'rails_helper'

RSpec.describe Upload, type: :model do

  it { is_expected.to belong_to :user }

  it { is_expected.to have_attached_file(:attachment) }
  it { is_expected.to validate_attachment_content_type(:attachment).allowing('application/octet-stream') }
  
end
