shared_context 'required_attributes' do |factory, attributes|
  context 'presence' do
    attributes.each do |attr|
      it "validates presence of #{attr}" do
        expect(build(factory, attr.to_sym => nil)).not_to be_valid
      end
    end
  end
end