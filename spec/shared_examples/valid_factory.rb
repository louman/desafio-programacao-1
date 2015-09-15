shared_context 'valid_factory' do |factory_name, more_examples = nil|
  context 'factory' do
    let (:subject) { build(factory_name) }
    it 'has a valid factory' do
      expect(subject).to be_valid
    end
    instance_exec(&more_examples) if more_examples.present?
  end
end